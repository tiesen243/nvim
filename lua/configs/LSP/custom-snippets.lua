local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end

-- LuaSnip setup
local snip = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local date = function()
	return { os.date("!%Y-%m-%dT%H:%M:%S.000Z") }
end

luasnip.add_snippets(nil, {
	typescriptreact = {
		snip(
			{
				trig = "nafce",
				name = "nextArrowFunctionExportComponent",
				dscr = "Create a nextjs arrow function export component",
			},
			fmt(
				[[
      import type { NextPage } from 'next'

      const [1]: NextPage = () => {
        return <div>[2]</div>
      }

      export default [2]
    ]],
				{ insert(1, "Page"), rep(1) },
				{ delimiters = "[]" }
			)
		),
		snip(
			{
				trig = "tsnafce",
				name = "typescriptArrowFunctionExportComponent",
				dscr = "Create a typescript arrow function export component",
			},
			fmt(
				[[
      import type { NextPage } from 'next'

      interface Props {
        params: {},
        searchParams: {},
      }

      const [1]: NextPage<Props> = () => {
        return <div>[2]</div>
      }

      export default [2]
    ]],
				{ insert(1, "Page"), rep(1) },
				{ delimiters = "[]" }
			)
		),

		snip(
			{
				trig = "nafcewc",
				name = "nextArrowFunctionExportComponentWithChildren",
				dscr = "Create a nextjs arrow function export component with children",
			},
			fmt(
				[[
      const [1]: React.FC<React.PropsWithChildren> = ({ children }) => {
        return <div>{children}</div>
      }

      export default [2]
    ]],
				{ insert(1, "Page"), rep(1) },
				{ delimiters = "[]" }
			)
		),

		snip({
			trig = "meta",
			name = "nextMetadata",
			dscr = "Create a nextjs metadata",
		}, {
			text({
				"import type { NextPage, Metadata } from 'next'",
				"",
				"export const metadata: Metadata = {",
				"\t\ttitle: '",
			}),
			insert(1, "title"),
			text({ "',", "\t\tdescription: '" }),
			insert(2, "description"),
			text({ "'", "}" }),
		}),

		snip({
			trig = "gmeta",
			name = "nextGenerateMetadata",
			dscr = "Create a nextjs generate metadata",
		}, {
			text({
				"import type { NextPage, Metadata } from 'next'",
				"",
				"export const generateMetadata = async ({}:Props): Promise<Metadata> => {",
				"\treturn {",
				"\t\ttitle: '",
			}),
			insert(1, "title"),
			text({ "',", "\t\tdescription: '" }),
			insert(2, "description"),
			text({ "'", "\t}", "}" }),
		}),

		snip({
			trig = "extenalLink",
			name = "externalLink",
			dscr = "Create a external link",
		}, {
			text({ '<a href="' }),
			insert(1, "href"),
			text({ '" target="_blank" rel="noopener noreferrer">' }),
			insert(2, "text"),
			text({ "</a>" }),
		}),

		snip({
			trig = "ucl",
			name = "use client",
			dscr = "Convert to client component",
		}, { text("'use client'") }),

		snip({
			trig = "usv",
			name = "use server",
			dscr = "Convert to server component",
		}, { text("'use server'") }),

		snip({
			trig = "fvl",
			name = "form value",
			dscr = "Get form value",
		}, {
			text("formData.get('"),
			insert(1, "name"),
			text("')"),
		}),
	},
	mdx = {
		snip({
			trig = "meta",
			name = "mdxMetadata",
			dscr = "Create a mdx metadata block to parse frontmatter",
		}, {
			text({ "---", "title: " }),
			insert(1, "title"),
			text({ "", "description: " }),
			insert(2, "description"),
			text({ "", "tags: []", "date: " }),
			func(date, {}),
			text({ "", "---" }),
		}),

		snip({
			trig = "code",
			name = "mdxCode",
			dscr = "Create a mdx code block",
		}, {
			text({ "```" }),
			insert(1, "language"),
			text({ "", "```" }),
		}),

		snip({
			trig = "img",
			name = "mdxImage",
			dscr = "Create a mdx image block",
		}, {
			text({ "![" }),
			insert(1, "alt"),
			text({ "](" }),
			insert(2, "src"),
			text({ ")" }),
		}),

		snip({
			trig = "link",
			name = "mdxLink",
			dscr = "Create a mdx link block",
		}, {
			text({ "[" }),
			insert(1, "text"),
			text({ "](" }),
			insert(2, "href"),
			text({ ")" }),
		}),

		snip({
			trig = "a",
			name = "mdxAnchor",
			dscr = "Create a mdx anchor block",
		}, {
			text({ '<a href="' }),
			insert(1, "href"),
			text({ '" target="_blank" rel="noopener noreferrer">' }),
			insert(2, "text"),
			text({ "</a>" }),
		}),
	},
	css = {
		snip({
			trig = "reset",
			name = "cssReset",
			dscr = "Create a css reset",
		}, {
			text({
				"@layer base {",
				"\t* {",
				"\t\t@apply relative box-border border-border selection:bg-foreground selection:text-background;",
				"\t}",
				"\tbody {",
				"\t\t@apply min-h-dvh overflow-x-hidden bg-background font-sans text-foreground antialiased;",
				"\t}",
				"",
				"\t/* prettier-ignore  */",
				"\th1, h2, h3, h4, h5, h6 {",
				"\t\t@apply text-balance;",
				"\t}",
				"\tp {",
				"\t\t@apply text-pretty;",
				"\t}",
				"\tarticle {",
				"\t\t@apply prose prose-lg prose-zinc dark:prose-invert prose-pre:m-0 prose-img:rounded-lg prose-img:shadow-lg;",
				"\t}",
				"",
				"\t::-webkit-scrollbar {",
				"\t\t@apply h-1 w-1;",
				"\t}",
				"\t::-webkit-scrollbar-track {",
				"\t\t@apply bg-transparent;",
				"\t}",
				"\t::-webkit-scrollbar-thumb {",
				"\t\t@apply rounded-full bg-default;",
				"\t}",
				"}",
			}),
		}),
	},
	javascript = {
		snip({
			trig = "prettier",
			name = "prettier config template",
			dscr = "Create a prettier config template",
		}, {
			text({
				"/** @type {import('prettier').Config & import('prettier-plugin-tailwindcss').PluginOptions} */",
				"const config = {",
				"\tprintWidth: 120,",
				"\tsemi: false,",
				"\tsingleQuote: true,",
				"\ttabWidth: 2,",
				"\ttrailingComma: 'all',",
				"\tplugins: ['prettier-plugin-tailwindcss'],",
				"}",
				"",
				"export default config",
			}),
		}),
	},
})
