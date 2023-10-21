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
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local get_visual = utils.get_visual
local in_mathzone = utils.in_mathzone
local in_text = utils.in_text

return {

	-- math modes
	s({trig="mm", snippetType="autosnippet"}, fmta("$<>$", {i(1)}), {condition=in_text}),
	s({trig="dm", snippetType="autosnippet"}, 
		fmta([[
			\[
				<>
			\]
			<>
			]], 
			{i(1), i(0)}),
		{condition = line_begin and in_text}),

	-- subscripts, superscripts and fractions
	s({trig="_", snippetType="autosnippet", wordTrig=false},
		fmta("_{<>}", {i(1)}),
		{condition = in_mathzone}),
	s({trig="^", snippetType="autosnippet", wordTrig=false},
		fmta("^{<>}", {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="//", snippetType="autosnippet", wordTrig=false},
		fmta("\\frac{<>}{<>}", {d(1, get_visual), i(2)}),
		{condition = in_mathzone}),

	-- letter modifiers
	s({trig="bar", snippetType="autosnippet"},
		fmta("\\overline{<>}", {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="dot", snippetType="autosnippet"},
		fmta("\\dot{<>}", {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="hat", snippetType="autosnippet"},
		fmta("\\hat{<>}", {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="til", snippetType="autosnippet"},
		fmta("\\tilde{<>}", {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="vec", snippetType="autosnippet"},
		fmta("\\vec{<>}", {d(1, get_visual)}),
		{condition = in_mathzone}),

	-- brackets
	s({trig="lr(", snippetType="autosnippet"},
		fmta([=[
			\left( <> \right)
		]=], {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="lr{", snippetType="autosnippet"},
		fmta([=[
			\left\{ <> \right\}
		]=], {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="lr[", snippetType="autosnippet"},
		fmta([=[
			\left[ <> \right]
		]=], {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="lr<", snippetType="autosnippet"},
		fmta([=[
			\left<< <> \right>>
		]=], {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="ceil", snippetType="autosnippet"},
		fmta([=[
			\lceil <> \rceil
		]=], {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="floor", snippetType="autosnippet"},
		fmta([=[
			\lfloor <> \rfloor
		]=], {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="norm", snippetType="autosnippet"},
		fmta([=[
			\lvert <> \rvert
		]=], {d(1, get_visual)}),
		{condition = in_mathzone}),
	s({trig="Norm", snippetType="autosnippet"},
		fmta([=[
			\lVert <> \rVert
		]=], {d(1, get_visual)}),
		{condition = in_mathzone}),

	-- running index symbols
	s({trig="sum", snippetType="autosnippet"},
		fmta([=[
			\sum_{<>}^{<>} <>
		]=], {i(1), i(2), d(3, get_visual)}),
		{condition = in_mathzone}),
	s({trig="prod", snippetType="autosnippet"},
		fmta([=[
			\prod_{<>}^{<>} <>
		]=], {i(1), i(2), d(3, get_visual)}),
		{condition = in_mathzone}),
	s({trig="Cap", snippetType="autosnippet"},
		fmta([=[
			\bigcap_{<>}^{<>} <>
		]=], {i(1), i(2), d(3, get_visual)}),
		{condition = in_mathzone}),
	s({trig="Cup", snippetType="autosnippet"},
		fmta([=[
			\bigcup_{<>}^{<>} <>
		]=], {i(1), i(2), d(3, get_visual)}),
		{condition = in_mathzone}),
	s({trig="And", snippetType="autosnippet"},
		fmta([=[
			\bigwedge_{<>}^{<>} <>
		]=], {i(1), i(2), d(3, get_visual)}),
		{condition = in_mathzone}),
	s({trig="Or", snippetType="autosnippet"},
		fmta([=[
			\bigvee_{<>}^{<>} <>
		]=], {i(1), i(2), d(3, get_visual)}),
		{condition = in_mathzone}),
	s({trig="Int", snippetType="autosnippet"},
		fmta([=[
			\int_{<>}^{<>} <> <>
		]=], {i(1), i(2), d(3, get_visual), i(4, "dx")}),
		{condition = in_mathzone}),
	s({trig="lim", snippetType="autosnippet"},
		fmta([=[
			\lim_{<>} <>
		]=], {i(1), d(3, get_visual)}),
		{condition = in_mathzone}),
}

