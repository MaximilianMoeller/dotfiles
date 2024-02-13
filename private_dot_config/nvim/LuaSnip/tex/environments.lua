local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local utils = require('plugins.luasnip.utils')
local line_begin = require("luasnip.extras.conditions.expand").line_begin
local get_visual = utils.get_visual
local in_mathzone = utils.in_mathzone
local in_text = utils.in_text

return {

	s({trig="beg", snippetType="autosnippet"},
		fmta([[
			\begin{<>}
				<>
			\end{<>}
		]],
		{i(1), i(0), rep(1)}),
		{condition= line_begin * in_text}),

}
