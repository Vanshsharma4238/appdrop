# AppDrop – Dynamic Widget Rendering (Flutter Assignment)

This Flutter app implements a **dynamic widget rendering engine** that builds an entire mobile screen from a JSON schema. No UI is hardcoded – all components are rendered based on JSON definitions.

---

## 🎯 Objective

- Parse JSON describing a page layout.
- Convert JSON into Dart models.
- Use a widget factory to map `"type"` fields to concrete widgets.
- Render the full screen dynamically (banner, carousel, grid, video, text).
- Make the design clean, minimal, and easily extensible.

---

## 🧱 Architecture Overview

**Main layers:**

- `models/`
  - `component_model.dart` – generic model for a single component.
- `data/`
  - `page_json.dart` – example page JSON used for rendering.
- `widgets/`
  - `banner_widget.dart`
  - `carousel_widget.dart`
  - `grid_widget.dart`
  - `video_widget.dart`
  - `text_widget.dart`
- `factory/`
  - `widget_factory.dart` – central place that maps `type` → widget.
- `screens/`
  - `home_screen.dart` – parses JSON and renders the list of components.

The **entry flow** is:

`JSON → Dart Models → WidgetFactory → Concrete Widgets → UI`

---

## 🧩 JSON → UI Mapping

The app expects a JSON in this format:

```json
{
  "page": {
    "components": [
      { "type": "banner", ... },
      { "type": "carousel", ... },
      { "type": "grid", ... },
      { "type": "video", ... },
      { "type": "text", ... }
    ]
  }
}
