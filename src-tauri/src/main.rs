// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use tauri::Manager;

fn main() {
    tauri::Builder::default()
    .setup(|app| {
        let webview = app.get_webview("main").unwrap();
        let _ = webview.eval("window.location.replace('http://localhost:9997')");
        Ok(())
      })
      .run(tauri::generate_context!())
      .expect("error running tauri app");
}

// fn main() {
//     tauri_window_location_lib::run()
// }
