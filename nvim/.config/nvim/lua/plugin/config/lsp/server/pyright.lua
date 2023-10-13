return {
	settings = {
		pyright = {
			disableLanguageServices = false,
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				autoImportCompletions = false,
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				typeCheckingMode = "off",
				useLibraryCodeForTypes = true,
			}
		}
	}
}
