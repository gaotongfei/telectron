electron = require 'electron'
app = electron.app
browserWindow = electron.BrowserWindow
shell = electron.shell

mainWindow = null

app.on 'window-all-closed', () -> app.quit() if process.paltform != 'darwin'

app.on 'ready', () ->
    mainWindow = new browserWindow width: 800, height: 600
    mainWindow.loadURL "https://web.telegram.com"

    mainWindow.webContents.openDevTools()

    mainWindow.on 'closed', () -> mainWindow = null

