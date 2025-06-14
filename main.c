/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amaltea <amaltea@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/04 13:02:17 by amaltea           #+#    #+#             */
/*   Updated: 2025/06/10 13:42:07 by amaltea          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fractol.h"

int	main(int argc, char **argv)
{
	t_fractal	fractal;

	if ((argc == 2 && !(ft_strncmp(argv[1], "mandelbrot", 10))) || (argc == 4
			&& !(ft_strncmp(argv[1], "julia", 5))))
	{
		fractal.name = argv[1];
		if (!(ft_strncmp(argv[1], "julia", 5)))
		{
			fractal.julia_x = atodoubl(argv[2]);
			fractal.julia_y = atodoubl(argv[3]);
		}
		fractal_init(&fractal);
		fractal_render(&fractal);
		mlx_loop(fractal.mlx_connection);
	}
	else
	{
		putstr_fd(ERROR_MESSAGE, STDERR_FILENO);
		exit(EXIT_FAILURE);
	}
}
