public class UTC.Indicator : Wingpanel.Indicator {
    private UTC.DisplayWidget display_widget;
    private UTC.PopoverWidget popover_widget;

    public Indicator(Wingpanel.IndicatorManager.ServerType server_type) {
        Object(
            code_name : "utc-wingpanel",
            display_name : _("UTC Time Indicator for Wingpanel"),
            description: _("Shows UTC time as an indicator on Windpanel.")
        );

        visible = true;
    }

    public override Gtk.Widget get_display_widget() {
        if (display_widget == null) {
            display_widget = new UTC.DisplayWidget();
            update();
        }

        return display_widget;
    }

    public override Gtk.Widget? get_widget() {
        if (popover_widget == null) {
            popover_widget = new UTC.PopoverWidget(this);
        }

        return popover_widget;
    }

    public override void opened() {
    }

    public override void closed() {
    }

    public void hide() {
        visible = false;
    }

    private void update() {
        if (display_widget != null) {
            Timeout.add_seconds(1, () => {
                display_widget.set_utc_time();
                return true;
            });
        }
    }
}

public Wingpanel.Indicator? get_indicator(Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    debug("Loading utc-indicator...");

    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        debug("Wingpanel is not in session, not loading utc-indicator");
        return null;
    }

    var indicator = new UTC.Indicator(server_type);

    return indicator;
}
