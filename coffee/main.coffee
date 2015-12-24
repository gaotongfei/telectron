electron = require 'electron'
app = electron.app
browserWindow = electron.BrowserWindow
shell = electron.shell

mainWindow = null

app.on 'window-all-closed', () -> app.quit() if process.paltform != 'darwin'

app.commandLine.appendSwitch 'proxy-server', '127.0.0.1:1080'

app.on 'ready', () ->
  mainWindow = new browserWindow width: 1000, height: 800, "node-integration": false
  mainWindow.webContents.setUserAgent """
    Mozilla/5.0 (Windows NT 10.0; WOW64)
    AppleWebKit/537.36 (KHTML, like Gecko)
    Chrome/46.0.2490.86 Safari/537.36"""
  mainWindow.loadURL "https://web.telegram.org"
  mainWindow.webContents.openDevTools()
  mainWindow.on 'closed', () -> mainWindow = null
