local status, mason = pcall(require, 'mason')
if (not status) then return end

local stautus2, lspconfig = pcall(require, 'mason-lspconfig')
if (not stautus2) then return end

mason.setup {}
lspconfig.setup {}
