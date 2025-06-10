# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amaltea <amaltea@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/10 02:39:29 by amaltea           #+#    #+#              #
#    Updated: 2025/06/10 13:45:03 by amaltea          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol

MLX_DIR = minilibx-linux
MLX = $(MLX_DIR)/libmlx.a
MLX_FLAGS = -L$(MLX_DIR) -lmlx -lm -lX11 -lXext
MLX_INC = -I$(MLX_DIR)

SRCS =	utils/atodoubl.c\
				utils/ft_strncmp.c\
				utils/putstr_fd.c\
				events.c\
				init.c\
				main.c\
				math_utils.c\
				render.c

OBJS = $(SRCS:.c=.o)

CC = cc

CFLAGS = -Wall -Werror -Wextra -I./ $(MLX_INC)

all: $(NAME)

$(MLX):
	make -C $(MLX_DIR)

$(NAME): $(MLX) $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(MLX_FLAGS) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

norm:
	norminette $(SRCS) fractol.h

clean:
	make -C $(MLX_DIR) clean
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all
