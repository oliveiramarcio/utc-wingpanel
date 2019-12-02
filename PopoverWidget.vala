public class UTC.PopoverWidget : Gtk.Grid {
    private UTC.Indicator indicator;

    public PopoverWidget(UTC.Indicator _indicator) {
        Object(orientation: Gtk.Orientation.VERTICAL);
        indicator = _indicator;
    }

    construct {
        var quit_button = new Gtk.ModelButton();
        quit_button.text = _("Quit");
        quit_button.get_style_context().add_class("menuitem");
        quit_button.get_style_context().remove_class("button");
        quit_button.hexpand = true;
        quit_button.clicked.connect(() => {
            indicator.hide();
        });

        attach(quit_button, 0, 0, 1, 1);
    }
}
