local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
    s("hello", {
        t('print("hello world")')
    })
})

ls.add_snippets("typescript", {
    s("SvelteGET", {
        t({
            "import { json } from '@sveltejs/kit';",
            "import type { RequestHandler } from './$types';",
            "",
            "export const GET: RequestHandler = async ({ url, request }) => {",
            "    "
        }),
        i(0),
        t({
            "",
            "};"
        })
    }),
    s("SveltePageServer", {
        t({
            "export const load = async ({ fetch, data, params }) => {",
            "    "
        }),
        i(0),
        t({
            "",
            "};"
        })
    })
})

ls.add_snippets("svelte", {
    s("SveltePage", {
        t({
            "<script lang=\"ts\">",
            "    export let data;",
            "</script>",
            "",
            "<div>",
            "    "
        }),
        i(0),
        t({
            "",
            "</div>"
        })
    })
})


