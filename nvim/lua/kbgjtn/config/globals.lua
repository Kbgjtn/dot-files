P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

local M = {}

M.Go = {
    tsc = {
        desc = "test cases",
        text_node = {
            "tests := []struct{",
            "  name string",
            "  in any",
            "  exp any",
            "}{",
            "  {",
            '     name: "",',
            "     in: nil,",
            "     exp: nil,",
            "  },",
            "}",
            "",
            "for _, tc := range tests {",
            "  t.Run(tc.name, func(t *testing.T) {",
            "  })",
            "}",
        },
    },
}

function M.SetupGoSnip()
    local luasnip = require("luasnip")
    local snip = luasnip.snippet
    local text_node = luasnip.text_node

    luasnip.add_snippets("go", {
        snip("tsc", { text_node(M.Go.tsc) }),
    })
end

return M
