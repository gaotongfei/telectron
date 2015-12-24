electron = require 'electron'
app = electron.app
browserWindow = electron.BrowserWindow
shell = electron.shell

mainWindow = null
config = require './config.json'

app.on 'window-all-closed', () -> app.quit() if process.paltform != 'darwin'

if config['use-proxy'] == true
  app.commandLine.appendSwitch 'proxy-server', config['proxy-server']

app.on 'ready', () ->
  mainWindow = new browserWindow width: 1000, height: 800, "node-integration": false
  mainWindow.webContents.setUserAgent """
    Mozilla/5.0 (Windows NT 10.0; WOW64)
    AppleWebKit/537.36 (KHTML, like Gecko)
    Chrome/46.0.2490.86 Safari/537.36"""
  mainWindow.loadURL config['url']
  mainWindow.on 'closed', () -> mainWindow = null
