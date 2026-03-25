cell_size = 16;

global.grid = mp_grid_create(
    0, 0,                        // posição inicial
    room_width div cell_size,           // número de células horizontal
    room_height div cell_size,          // número de células vertical
    cell_size,                          // largura célula
    cell_size                           // altura célula
);

