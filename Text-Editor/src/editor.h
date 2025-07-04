#ifndef EDITOR_H_
#define EDITOR_H_

#include <stdlib.h>

typedef struct {
	size_t capacity;
	size_t size;
	char* chars;
} Line;

void line_insert_text_before(Line* line, const char* text, size_t* col);
void line_backspace(Line* line, size_t* col);
void line_delete(Line* line, size_t* col);

typedef struct {
	size_t capacity;
	size_t size;
	Line* lines;
	size_t cursor_row;
	size_t cursor_col;
} Editor;

void editor_insert_text_before_cursor(Editor* editor, const char* text);
void editor_insert_new_line(Editor* editor);
void editor_backspace(Editor* editor);
void editor_delete(Editor* editor);
const char* editor_char_under_cursor(const Editor* editor);

#endif // EDITOR_H_
