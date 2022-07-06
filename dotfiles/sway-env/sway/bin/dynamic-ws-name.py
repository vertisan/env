#!/usr/bin/env python3
# _*_ coding: utf-8 _*_

from tokenize import Number
from i3ipc import Connection, Event

# Create the Connection object that can be used to send commands and subscribe to events.
i3 = Connection()


def icon(app_class: str = None, ws_index: Number = None, app_id: Number = None) -> str:
    """
    Definitions of the icons and workspaces
    """
    # Default icons based on num of the workspaces
    by_index = ["", "", "", "", "", "6", "7", "8", "9", ""]

    # Icons
    by_class = {
        # Media
        "": ["Spotify"],
        # Programming
        "": ["Code"],
        # Mail
        "": ["Thunderbird"],
        # Browsers
        "": ["Google-chrome"],
        # Communication
        "": ["Mattermost"],
        # Terminal
        "": []
    }

    by_app_id = {
        "": ["Alacritty"]
    }

    if ws_index is not None:
        try:
            return by_index[ws_index - 1]
        except IndexError:
            return f"[{ws_index - 1}]"

def assign_generic_name(i3, e):
    """
    i3 events
    """
    try:
        if not e.change == 'rename':  # avoid looping
            con = i3.get_tree().find_focused()
            if not con.type == 'workspace':
                if not e.change == 'new':
                    # is_floating = con.type == 'floating_con' or con.floating and '_on' in con.floating

                    # Tiling mode or floating indication. Change symbols if necessary.
                    ws_old_name = con.workspace().name
                    ws_name = "%s: %s " % (
                        con.workspace().num, icon(ws_index=con.workspace().num))

                    i3.command('rename workspace "%s" to %s' %
                               (ws_old_name, ws_name))
                else:
                    # In sway we may open a new window w/o moving focus; let's give the workspace a name anyway.
                    con = i3.get_tree().find_by_id(e.container.id)
                    ws_num = con.workspace().num
                    w_name = con.name if con.name else ''

                    if w_name and ws_num:
                        name = "%s: %s\u00a0%s" % (
                            ws_num, icon(ws_index=con.workspace().num), w_name)
                        i3.command('rename workspace "%s" to %s' %
                                   (ws_num, name))

            else:
                # Give the (empty) workspace a generic name: "number: glyph" (like "1: ")
                ws_num = con.workspace().num
                ws_new_name = "G %s: %s" % (ws_num, icon(ws_index=con.workspace().num))

                i3.command('rename workspace to "{}"'.format(ws_new_name))
    except:
        pass


def main():
    # Subscribe to events
    i3.on(Event.WORKSPACE_FOCUS, assign_generic_name)
    i3.on(Event.WINDOW_FOCUS, assign_generic_name)
    i3.on(Event.WINDOW_TITLE, assign_generic_name)
    i3.on(Event.WINDOW_CLOSE, assign_generic_name)
    i3.on(Event.WINDOW_NEW, assign_generic_name)
    i3.on(Event.BINDING, assign_generic_name)

    # i3.on(Event.WORKSPACE_FOCUS, assign_generic_name)
    # i3.on(Event.BINDING, assign_generic_name)

    i3.main()


if __name__ == "__main__":
    main()
