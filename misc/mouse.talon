settings():
    #stop continuous scroll/gaze scroll with a pop
    user.mouse_enable_pop_stops_scroll = 0
    #enable pop click with 'control mouse' mode
    user.mouse_enable_pop_click = 1
    #hide cursor when mouse_wake is called to enable zoom mouse
    user.mouse_wake_hides_cursor = 1
control mouse: user.mouse_toggle_control_mouse()
zoom mouse: user.mouse_toggle_zoom_mouse()
camera overlay: eye_mouse.camera_overlay.toggle()
run calibration: user.mouse_calibrate()
<user.mouse_index>: user.mouse_click(mouse_index, 1)
<user.modifiers> <user.mouse_index>:
    key("{modifiers}:down")
    mouse_click(mouse_index)
    key("{modifiers}:up")
(dubclick | duke | dyke):
    user.mouse_click(0, 2)
(tripclick | triplick | trike):
    user.mouse_click(0, 3)
wheel down: user.mouse_scroll_down()
wheel tiny [down]: mouse_scroll(20)
wheel downer: user.mouse_scroll_down_continuous()
wheel up: user.mouse_scroll_up()
wheel tiny up: mouse_scroll(-20)
wheel upper: user.mouse_scroll_up_continuous()
wheel gaze: user.mouse_gaze_scroll()
wheel stop: user.mouse_scroll_stop()
wheel left: mouse_scroll(0, -40)
wheel tiny left: mouse_scroll(0, -20)
wheel right: mouse_scroll(0, 40)
wheel tiny right: mouse_scroll(0, 20)
curse (show|yes): user.mouse_show_cursor()
curse (hide|no): user.mouse_hide_cursor()
drag: user.mouse_drag()
mouse sleep: user.mouse_sleep()
mouse wake: user.mouse_wake()
eagle: user.mouse_zoom_click()
cancel zoom: user.mouse_cancel_zoom_mouse()
