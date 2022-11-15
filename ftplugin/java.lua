print("Hello from  fucking java.lua")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
print(project_name)

local workspace_dir = '/home/mohdebia/jdt/workspace/' .. project_name

local config = {
  cmd = {
    '/usr/lib/jvm/java-17-openjdk-amd64/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.level=ALL',
    '-noverify',
    '-Xmx1G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/home/khalimouh/jdt/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/home/khalimouh/jdt/config_linux',
    '-data', workspace_dir
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml'}),
  settings = {
    java = {
    }
  },
  init_options = {
    bundles = {}
  },
}
require('jdtls').start_or_attach(config)
