local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

local root_markers = {
	"gradlew",
	"pom.xml",
	".git",
	"build.gradle",
	"settings.gradle",
	"build.xml",
	"pom.xml",
	"mvnw",
	"gradle.properties",
	"application.properties",
	"application.yml",
	"application.yaml",
	"application.conf",
	"application.json",
	"application.xml",
}

local home = os.getenv("HOME")
local jdtls_root = home .. "/java/"
local jdtls_version = "1.9.0-202203031534"
local jdtls_name = "jdt-language-server-" .. jdtls_version
local jdtls_path = jdtls_root .. jdtls_name
local launcher_version = "1.6.400.v20210924-0641"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local document_file = "/Documents/.code/java/"
local workspace_dir = home .. document_file .. project_name

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"-Xmx2G",
		"-jar",
		jdtls_path .. "/plugins/org.eclipse.equinox.launcher_" .. launcher_version .. ".jar",
		"-configuration",
		jdtls_path .. "/config_linux",

		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	settings = {
		java = {},
	},
	init_options = {
		bundles = {},
	},
}

require("jdtls").start_or_attach(config)
