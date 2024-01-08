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
local in_mathzone = utils.in_mathzone


-- this file only contains static snippets, i.e. snippets for which no input is needed
return {
	-- sets
	s({trig="eset", snippetType="autosnippet"}, t("\\emptyset"), {condition = in_mathzone}),
	s({trig="NN", snippetType="autosnippet"}, t("\\N"), {condition = in_mathzone}),
	s({trig="ZZ", snippetType="autosnippet"}, t("\\Z"), {condition = in_mathzone}),
	s({trig="QQ", snippetType="autosnippet"}, t("\\Q"), {condition = in_mathzone}),
	s({trig="RR", snippetType="autosnippet"}, t("\\R"), {condition = in_mathzone}),
	s({trig="CC", snippetType="autosnippet"}, t("\\C"), {condition = in_mathzone}),
	s({trig="in", snippetType="autosnippet"}, t("\\in"), {condition = in_mathzone}),
	s({trig="nin", snippetType="autosnippet"}, t("\\notin"), {condition = in_mathzone}),
	s({trig="sub", snippetType="autosnippet"}, t("\\subset"), {condition = in_mathzone}),
	s({trig="nsub", snippetType="autosnippet"}, t("\\nsubset"), {condition = in_mathzone}),
	s({trig="Sub", snippetType="autosnippet"}, t("\\subseteq"), {condition = in_mathzone}),
	s({trig="nSub", snippetType="autosnippet"}, t("\\nsubseteq"), {condition = in_mathzone}),
	s({trig="Snub", snippetType="autosnippet"}, t("\\subsetneq"), {condition = in_mathzone}),
	s({trig="sup", snippetType="autosnippet"}, t("\\supset"), {condition = in_mathzone}),
	s({trig="nsup", snippetType="autosnippet"}, t("\\nsupset"), {condition = in_mathzone}),
	s({trig="Sup", snippetType="autosnippet"}, t("\\supseteq"), {condition = in_mathzone}),
	s({trig="nSup", snippetType="autosnippet"}, t("\\nsupseteq"), {condition = in_mathzone}),
	s({trig="Snup", snippetType="autosnippet"}, t("\\supsetneq"), {condition = in_mathzone}),
	s({trig="cup", snippetType="autosnippet"}, t("\\cup"), {condition = in_mathzone}),
	s({trig="cap", snippetType="autosnippet"}, t("\\cap"), {condition = in_mathzone}),
	s({trig="--", snippetType="autosnippet"}, t("\\setminus"), {condition = in_mathzone}),
	s({trig="EE", snippetType="autosnippet"}, t("\\exists"), {condition = in_mathzone}),
	s({trig="AA", snippetType="autosnippet"}, t("\\forall"), {condition = in_mathzone}),
	
	-- logic
	s({trig="=>", snippetType="autosnippet"}, t("\\implies"), {condition = in_mathzone}),
	s({trig="=<", snippetType="autosnippet"}, t("\\impliedby"), {condition = in_mathzone}),
	s({trig="iff", snippetType="autosnippet"}, t("\\iff"), {condition = in_mathzone}),
	s({trig="gdw", snippetType="autosnippet"}, t("\\iff"), {condition = in_mathzone}),
	s({trig="top", snippetType="autosnippet"}, t("\\top"), {condition = in_mathzone}),
	s({trig="bot", snippetType="autosnippet"}, t("\\bot"), {condition = in_mathzone}),
	s({trig="eq", snippetType="autosnippet"}, t("\\equiv"), {condition = in_mathzone}),
	s({trig="neg", snippetType="autosnippet"}, t("\\neg"), {condition = in_mathzone}),
	s({trig="not", snippetType="autosnippet"}, t("\\neg"), {condition = in_mathzone}),
	s({trig="and", snippetType="autosnippet"}, t("\\land"), {condition = in_mathzone}),
	s({trig="or", snippetType="autosnippet"}, t("\\lor"), {condition = in_mathzone}),
	s({trig="vD", snippetType="autosnippet"}, t("\\vDash"), {condition = in_mathzone}),
	s({trig="nvD", snippetType="autosnippet"}, t("\\not\\vDash"), {condition = in_mathzone}),
	s({trig="vd", snippetType="autosnippet"}, t("\\vdash"), {condition = in_mathzone}),
	s({trig="nvd", snippetType="autosnippet"}, t("\\not\\vdash"), {condition = in_mathzone}),
	s({trig="Vd", snippetType="autosnippet"}, t("\\Vdash"), {condition = in_mathzone}),
	s({trig="nVd", snippetType="autosnippet"}, t("\\not\\Vdash"), {condition = in_mathzone}),
	
	
	-- squared symbols
	s({trig="scup", snippetType="autosnippet"}, t("\\sqcup"), {condition = in_mathzone}),
	s({trig="scap", snippetType="autosnippet"}, t("\\sqcap"), {condition = in_mathzone}),
	s({trig="ssub", snippetType="autosnippet"}, t("\\sqsubset"), {condition = in_mathzone}),
	s({trig="nssub", snippetType="autosnippet"}, t("\\not\\sqsubset"), {condition = in_mathzone}),
	s({trig="sSub", snippetType="autosnippet"}, t("\\sqsubseteq"), {condition = in_mathzone}),
	s({trig="nsSub", snippetType="autosnippet"}, t("\\not\\sqsubseteq"), {condition = in_mathzone}),
	
	-- binary relations
	s({trig=":=", snippetType="autosnippet"}, t("\\coloneqq"), {condition = in_mathzone}),
	s({trig=":iff", snippetType="autosnippet"}, t("\\logeq"), {condition = in_mathzone}),
	s({trig="=d", snippetType="autosnippet"}, t("\\defeq"), {condition = in_mathzone}),
	s({trig=">=", snippetType="autosnippet"}, t("\\geq"), {condition = in_mathzone}),
	s({trig="<=", snippetType="autosnippet"}, t("\\leq"), {condition = in_mathzone}),
	s({trig="!=", snippetType="autosnippet"}, t("\\neq"), {condition = in_mathzone}),
	s({trig="~~", snippetType="autosnippet"}, t("\\sim"), {condition = in_mathzone}),
	s({trig="~=", snippetType="autosnippet"}, t("\\simeq"), {condition = in_mathzone}),
	s({trig="<<", snippetType="autosnippet"}, t("\\ll"), {condition = in_mathzone}),
	s({trig=">>", snippetType="autosnippet"}, t("\\gg"), {condition = in_mathzone}),
	s({trig="->", snippetType="autosnippet"}, t("\\to"), {condition = in_mathzone}),
	s({trig="|>", snippetType="autosnippet"}, t("\\mapsto"), {condition = in_mathzone}),
	s({trig="<-", snippetType="autosnippet"}, t("\\leftarrow"), {condition = in_mathzone}),

	-- operators
	s({trig="xx", snippetType="autosnippet"}, t("\\times"), {condition = in_mathzone}),
	s({trig="**", snippetType="autosnippet"}, t("\\cdot"), {condition = in_mathzone}),

	-- misc
	s({trig="..", snippetType="autosnippet"}, t("\\ldots"), {condition = in_mathzone}),
	s({trig="contra", snippetType="autosnippet"}, t("\\contra"), {condition = in_mathzone}),
	
}
