public class UTC.DisplayWidget : Gtk.Grid {
    private Gtk.Label utc_label;

    construct {
        column_spacing = 4;
        margin_top = 4;
        utc_label = new Gtk.Label("");
        utc_label.halign = Gtk.Align.START;
        utc_label.hexpand = true;
        utc_label.margin_start = 9;
        utc_label.get_style_context().add_class(Granite.STYLE_CLASS_H4_LABEL);
        attach(utc_label, 0, 0, 1, 1);
        set_utc_time();
    }

    public void set_utc_time() {
        utc_label.set_label(new GLib.DateTime.now_utc().format("%a, %b %d      %H:%M:%S (UTC)"));
    }
}
