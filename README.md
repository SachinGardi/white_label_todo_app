# White-Label Configurable To-Do App
Flutter | BLoC 9.1.1 | API-Driven UI

---

## 1. Overview

This application demonstrates a **white-label capable Flutter To-Do app** where the **UI, theme, and features are fully controlled by an API-driven JSON configuration**.
The same codebase can be reused for multiple clients by changing only the API response, without modifying the app code.

---

## 2. What is API-Driven Configuration?

API-driven configuration means:
- The backend sends a JSON response
- The app reads this JSON at runtime
- UI, branding, and features are rendered dynamically based on the response

This approach enables:
- White-labeling
- Feature toggling
- Client-specific branding
- Faster customization without app rebuilds

---

## 3. How API-Driven Config Works in This App

### Step 1: API Response (Mocked)

```json
{
  "appId": "com.example.whitelabel.todo",
  "appName": "White Label Tasks",
  "theme": {
    "mode": "dark",
    "primaryColor": "#4CAF50",
    "secondaryColor": "#FFC107"
  },
  "components": {
    "showAddButton": true,
    "showSearchBar": true,
    "customButtons": [
      {
        "id": "sync",
        "label": "Sync",
        "action": "SYNC_TODOS"
      }
    ]
  }
}
```

---

### Step 2: Parsing the Config

The JSON is parsed into a strongly typed model (`AppConfig`) that converts:
- Hex colors → `Color`
- Feature flags → `bool`
- Theme mode → `ThemeMode`
- Dynamic buttons → executable UI actions

---

### Step 3: Config State Management (Cubit)

`ConfigCubit` is responsible for:
- Loading API config
- Holding the current configuration
- Notifying the UI of changes

```dart
class ConfigCubit extends Cubit<AppConfig?> {
  void loadConfig(Map<String, dynamic> json) {
    emit(AppConfig.fromJson(json));
  }
}
```

---

### Step 4: Dynamic UI Rendering

UI widgets listen to `ConfigCubit` and render conditionally:

```dart
if (config.showSearchBar) SearchBarWidget();
if (config.showAddButton) AddTodoButton();
```

No UI behavior is hardcoded.

---

### Step 5: Dynamic Theming

Theme is applied at runtime:

```dart
MaterialApp(
  themeMode: config.isDark ? ThemeMode.dark : ThemeMode.light,
)
```

This allows runtime branding changes.

---

## 4. How White-Labeling Is Achieved

| Aspect | Controlled via API |
|------|-------------------|
| App Name | Yes |
| Theme Colors | Yes |
| Light/Dark Mode | Yes |
| Feature Visibility | Yes |
| Custom Buttons | Yes |
| Business Logic | Shared |

---

## 5. Extending the App for Future White-Label Needs

### 5.1 Add New Features
- Add config flag in API
- Read flag in `AppConfig`
- Conditionally render UI

### 5.2 Client Branding
- Add logo URL & fonts in API
- Apply dynamically in theme

### 5.3 Server-Driven Navigation
- Backend defines navigation flow
- App renders screens dynamically

### 5.4 Feature Flags & Experiments
- Enable/disable features remotely
- Roll out features gradually

### 5.5 Multi-Client Builds
- Use Flutter flavors
- Load config per client

---

## 6. Why This Architecture Scales

- Single codebase
- Configuration-driven UI
- Clean separation of concerns
- Easy maintenance & testing

---

## 7. Summary

- API controls UI and branding
- Cubit manages configuration
- Bloc handles business logic
- App is fully white-label ready

---

End of Assignment
