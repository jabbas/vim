return {

  'ms-jpq/coq_nvim', branch = 'coq' , build = ":COQdeps",
  dependencies = {
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
    { 'ms-jpq/coq.thirdparty', branch = '3p', lazy = false },
  },

  init = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up',
    }
  end,

}
