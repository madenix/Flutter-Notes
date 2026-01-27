# Flutter Widget Types – Quick Reference

This document groups Flutter widgets by **purpose and responsibility**.  
Understanding this structure covers ~70% of Flutter UI development.

---

## 1. Structural Widgets (App Skeleton)
These form the foundation of the application.

- MaterialApp  
- CupertinoApp  
- WidgetsApp  
- Scaffold  
- AppBar  
- Navigator  
- SafeArea  
- MediaQuery  

---

## 2. Layout Widgets
Used to **position and arrange** other widgets.

### Single-child layout widgets
- Center  
- Padding  
- Align  
- SizedBox  
- Expanded *(Parent: Row / Column)*  
- Flexible  
- AspectRatio  
- FittedBox  

### Multi-child layout widgets
- Row  
- Column  
- Stack  
- Wrap  
- ListView  
- GridView  
- Flow  

---

## 3. Paint / Decoration Widgets 🎨
Widgets that **draw** colors, borders, shadows, and shapes.

- Container  
- DecoratedBox  
- ColoredBox  
- Card  
- Material  
- Opacity  
- ClipRRect  
- ClipOval  
- ClipPath  

---

## 4. Text & Display Widgets
Used for text and visual output.

- Text  
- RichText  
- SelectableText  
- Icon  
- Image  
- FlutterLogo  
- Placeholder  

---

## 5. Input / Interaction Widgets
Receive input from the user.

- TextField  
- TextFormField  
- Checkbox  
- Radio  
- Switch  
- Slider  
- DropdownButton  
- DatePicker  
- TimePicker  

---

## 6. Button Widgets
Clickable action widgets.

- ElevatedButton  
- TextButton  
- OutlinedButton  
- IconButton  
- FloatingActionButton  
- PopupMenuButton  

---

## 7. Scrolling Widgets
Used for scrolling content and lists.

- SingleChildScrollView  
- ListView  
- GridView  
- CustomScrollView  
- SliverList  
- SliverGrid  
- Scrollbar  

---

## 8. Positioning / Layer Widgets
Used for overlapping and positioning widgets.

- Stack  
- Positioned  
- IndexedStack  
- Align  

---

## 9. State Management / Logic Widgets
Widgets related to state and data handling.

- StatefulWidget  
- InheritedWidget  
- InheritedModel  
- ValueListenableBuilder  
- StreamBuilder  
- FutureBuilder  

---

## 10. Animation Widgets
Used for animations and transitions.

- AnimatedContainer  
- AnimatedOpacity  
- AnimatedAlign  
- AnimatedPositioned  
- Hero  
- FadeTransition  
- ScaleTransition  
- SlideTransition  

---

## 11. Theme & Styling Widgets
Control application-wide styling.

- Theme  
- ThemeData  
- DefaultTextStyle  
- IconTheme  
- MediaQuery  

---

## 12. Utility / Helper Widgets
Usually invisible but very powerful.

- Builder  
- LayoutBuilder  
- GestureDetector  
- InkWell  
- IgnorePointer  
- AbsorbPointer  
- Visibility  
- Offstage  

---

## Flutter Philosophy 🧠

> Everything is a widget.  
> Padding is a widget.  
> Logic is a widget.  
> UI is a widget.

---

## Quick Memory Tips 🎯

- Layout → Row / Column  
- Centering → Center  
- Size → SizedBox  
- Color & Border → Container  
- Interaction → InkWell / GestureDetector  
- Scrolling → ListView  

---

Happy Fluttering 🚀
