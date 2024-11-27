require('config')
--vim.api.nvim_set_keymap('n', '<Leader>x', [[:!python3 %<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', [[:!cargo run<CR>]], { noremap = true, silent = true })

-- ===============================================================================================
-- Definición de la función execute_python_script
function execute_python_script()
    -- Obtener la ruta del entorno virtual de Python
    local virtual_env_python = os.getenv('VIRTUAL_ENV')
    -- Obtener la ruta completa del archivo actual
    local current_file = vim.fn.expand('%:p')

    -- Verificar si la variable de entorno VIRTUAL_ENV está definida y no está vacía
    if virtual_env_python and virtual_env_python ~= '' then
        -- Concatenar la ruta del intérprete de Python del entorno virtual
        virtual_env_python = virtual_env_python .. '/bin/python3'
        -- Verificar si el intérprete de Python del entorno virtual es ejecutable
        if vim.fn.executable(virtual_env_python) == 1 then
            -- Ejecutar el script utilizando el intérprete de Python del entorno virtual
            local output = vim.fn.system(virtual_env_python .. ' ' .. current_file)
            -- Escribir la salida del comando en la ventana de mensajes de Neovim
            vim.api.nvim_out_write(output)
            -- Salir de la función después de ejecutar el script
            return
        end
    end

    -- Si no se encuentra un entorno virtual activo o el intérprete de Python del entorno virtual no es ejecutable,
    -- ejecutar el script utilizando el intérprete de Python del sistema
    local output = vim.fn.system('python3 ' .. current_file)
    -- Escribir la salida del comando en la ventana de mensajes de Neovim
    vim.api.nvim_out_write(output)
end

-- Mapear la función execute_python_script al comando <Leader>x en el modo normal
vim.api.nvim_set_keymap('n', '<Leader>x', '<cmd>lua execute_python_script()<CR>', { noremap = true, silent = true })

-- =========================================================================================================================
