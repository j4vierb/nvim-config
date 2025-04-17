return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup({
      auto_session_suppress_dirs = {'~/', '~/downloads', '/'},
      session_lens = {
        bufftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
      vim.keymap.set('n', '<C-s>', require('auto-session.session-lens').search_session, {
        noremap = true
      }),
    })
  end
}
