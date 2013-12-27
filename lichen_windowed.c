/*Copyright (C) 2013 Justin Green <electrojustin@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to NO CONDITIONS.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OR CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.*/

#define DEFAULTS	"*delay:	30000	\n" \
			"*count:	30	\n" \
			"*showFPS:	False	\n" \
			"*wireframe:	False	\n" \

#define refresh_cells 0
#define MAX_HEIGHT 4000
#define MAX_WIDTH 4000

#include "xlockmore.h"
#include "cell.h"
#include <ctype.h>
#include <stdio.h>
#include <GL/glut.h>

#ifdef USE_GL

int insert_cell (cell* to_check);
void remove_cell (void);
void set_pixel(int x, int y, int r, int g, int b);

GLXContext *glx_context;

cell cells [MAX_HEIGHT] [MAX_WIDTH];
cell* current;
char* pixels = NULL;
unsigned int num_cells;
unsigned int num_cells_buf;
unsigned int i;
unsigned int j;
unsigned int h = MAX_HEIGHT;
unsigned int w = MAX_WIDTH;
unsigned int new_x;
unsigned int new_y;

static XrmOptionDescRec opts[] = {0};
static argtype vars[] = {0};

ENTRYPOINT ModeSpecOpt cells_opts = {0, opts, 0, vars, NULL};

ENTRYPOINT void
reshape_cells (ModeInfo *mi, int width, int height)
{

	if (height != h || width != w)
	{
		h = height;
		w = width;
	
		for (i = 0; i < w; i ++)
		{
			for (j = 0; j < h; j ++)
			{
				cells [i] [j].state [0] = 0;
				cells [i] [j].state [1] = 0;
				cells [i] [j].state [2] = 0;
				cells [i] [j].state [3] = 0;
				cells [i] [j].x = i;
				cells [i] [j].y = j;
			}
		}
	
		num_cells = 1;
		current = &(cells [random ()%w] [random ()%h]);
		current->state [3] = random ()%3;
		current->state [current->state [3]] = 255;
		current->spawn_thresh = random ()%5 + 250;
		current->last = current;
		current->next = current;
	
		if (pixels != NULL)
			free (pixels);
		pixels = (char*)malloc (h*w*3);
		for (i = 0; i < h*w*3; i++)
			pixels [i] = 0;
	}

	GLfloat h1;
	h1 = (GLfloat) height / (GLfloat) width;
	glViewport (0, 0, (GLint) width, (GLint) height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective (45.0, 1/h1, 1.0, 300.0);
	glMatrixMode(GL_MODELVIEW);
	glClear (GL_COLOR_BUFFER_BIT);
}

ENTRYPOINT void
release_cells (ModeInfo *mi)
{
	free (pixels);
}

ENTRYPOINT Bool
cells_handle_event (ModeInfo *mi, XEvent *event)
{
	return 0;
}

ENTRYPOINT void
init_cells (ModeInfo *mi)
{
	glx_context = init_GL (mi);
	reshape_cells (mi, MI_HEIGHT(mi), MI_WIDTH(mi));	
}

ENTRYPOINT void
draw_cells (ModeInfo *mi)
{
	Display *dpy = MI_DISPLAY (mi);
	Window window = MI_WINDOW (mi);
	glXMakeCurrent (dpy, window, *glx_context);

	num_cells_buf = 0;
	for (i = 0; i < num_cells; i ++)
	{
		if (current->state [current->state [3]] == current->spawn_thresh)
		{
			if (current->y > 0)
				insert_cell (&(cells [current->x] [current->y-1]));
			if (current->x > 0)
				insert_cell (&(cells [current->x-1] [current->y]));
			if (current->y < h-1)
				insert_cell (&(cells [current->x] [current->y+1]));
			if (current->x < w-1)
				insert_cell (&(cells [current->x+1] [current->y]));
		}
		if (current->state [current->state [3]] <= 1)
			remove_cell ();
		else
			current->state [current->state [3]] --;

		set_pixel (current->x, current->y, current->state [0], current->state [1], current->state [2]);
		
		current = current->next;
	}

	if (random ()%100 == 1)
	{
		if (num_cells == 0)
		{
			current = &(cells [random ()%w] [random ()%h]);
			current->state [3] = random ()%3;
			current->state [current->state [3]] = 255;
			current->spawn_thresh = random ()%5 + 250;
			current->next = current;
			current->last = current;
			num_cells ++;
		}
		else
		{
			if (insert_cell (&(cells [random ()%w] [random ()%h])))
			{
				current->next->state [current->next->state [3]] = 0;
				current->next->state [3] = random ()%3;
				current->next->state [current->next->state [3]] = 255;
			}
		}
	}

	glDrawPixels (w, h, GL_RGB, GL_UNSIGNED_BYTE, pixels);
	glXSwapBuffers (dpy, window);

	num_cells += num_cells_buf;
}

int insert_cell (cell* to_check)
{
	new_x = to_check->x;
	new_y = to_check->y;
	if (to_check->state [to_check->state [3]] == 0)
	{
		cell* new_cell = &(cells [new_x] [new_y]);
		new_cell->next = current->next;
		current->next->last = new_cell;
		current->next = new_cell;
		if (num_cells == 1)
			current->last = new_cell;
		new_cell->last = current;
		new_cell->state [3] = current->state [3];
		new_cell->state [new_cell->state [3]] = 255;
		new_cell->spawn_thresh = random ()%5 + 250;
		num_cells ++;
		return 1;
	}
	return 0;
}

void remove_cell (void)
{
	current->state [current->state [3]] = 0;
	current->last->next = current->next;
	current->next->last = current->last;
	num_cells_buf --;
}

void set_pixel(int x, int y, int r, int g, int b) {

  pixels[(y*w+x)*3+0] = r;
  pixels[(y*w+x)*3+1] = g;
  pixels[(y*w+x)*3+2] = b;

}

XSCREENSAVER_MODULE_2 ("Lichen", lichen, cells)
#endif
