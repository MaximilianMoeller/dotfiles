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
local get_visual = utils.get_visual
local in_mathzone = utils.in_mathzone
local in_text = utils.in_text

return {
	s({trig="itt", snippetType="autosnippet"}, fmta([[\textit{<>}]],{d(1, get_visual),}), {condition=in_text}),
	s({trig="bft", snippetType="autosnippet"}, fmta([[\textbf{<>}]],{d(1, get_visual),}), {condition=in_text}),
	s({trig="sct", snippetType="autosnippet"}, fmta([[\textsc{<>}]],{d(1, get_visual),}), {condition=in_text}),

	s({trig="mc", snippetType="autosnippet"}, fmta([[\mathcal{<>}]],{d(1, get_visual),}), {condition=in_mathzone}),
	s({trig="ms", snippetType="autosnippet"}, fmta([[\mathscr{<>}]],{d(1, get_visual),}), {condition=in_mathzone}),
	s({trig="mf", snippetType="autosnippet"}, fmta([[\mathfrak{<>}]],{d(1, get_visual),}), {condition=in_mathzone}),
	s({trig="mb", snippetType="autosnippet"}, fmta([[\bm{<>}]],{d(1, get_visual),}), {condition=in_mathzone}),
	s({trig="tt", snippetType="autosnippet"}, fmta([[\text{<>}]],{d(1, get_visual),}), {condition=in_mathzone}),
	s({trig="vv", snippetType="autosnippet"}, fmta([[\var{<>}]],{d(1, get_visual),}), {condition=in_mathzone}),
	s({trig="ff", snippetType="autosnippet"}, fmta([[\func{<>}]],{d(1, get_visual),}), {condition=in_mathzone}),
}
