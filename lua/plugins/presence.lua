return {
    'andweeb/presence.nvim',
    config = function()
        require('presence').setup {
            neovim_image_text = "the people must know",
        }
     end
}
