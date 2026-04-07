#include "EditorState.h"

EditorState* EditorState::instance() {
    static EditorState* res = new EditorState();
    return res;
}
