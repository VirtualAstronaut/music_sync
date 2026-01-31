---
trigger: model_decision
description: when working on UI
---

### Clean Composition Rule (Flutter)
Always prioritize **Composition over Nesting** to maintain a readable "Table of Contents" in the [build](cci:1://file:///Volumes/OneTeabee/Workspace/personal/yt_sync/yt_sync/lib/src/app.dart:9:2-13:3) method.

1. **Extract Sections**: Separate major UI blocks (e.g., Search Bars, Result Lists, Detail Cards) into private `Stateless` or `Consumer` widgets within the same file.
2. **Minimalist build()**: The primary [build](cci:1://file:///Volumes/OneTeabee/Workspace/personal/yt_sync/yt_sync/lib/src/app.dart:9:2-13:3) method should contain almost zero logical branches (ternaries/ifs). It should primarily define layout (Scaffold, Columns, Padding) using the extracted widgets.
3. **AsyncValue Delegation**: Never chain `.when()` or `.fold()` directly inside a layout-heavy [build](cci:1://file:///Volumes/OneTeabee/Workspace/personal/yt_sync/yt_sync/lib/src/app.dart:9:2-13:3) method. Instead, pass the query or state to a dedicated "ResultView" widget that handles the `AsyncValue` logic internally.
4. **Switch Expressions**: When handling `AsyncValue` or state patterns, prefer modern Dart **Switch Expressions** over traditional `.when()` callbacks for flatter, more readable code.
5. **Clear Order**: Ensure a logical top-to-bottom flow. Logic-heavy variables should be moved to the specific small widgets where they are actually used, rather than sitting at the top of the main screen.