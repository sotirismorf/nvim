local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

local options = {
	filetypes = { "*" },
	user_default_options = {
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	}
}

colorizer.setup(options)
