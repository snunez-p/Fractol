# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amaltea <amaltea@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/10 02:39:29 by amaltea           #+#    #+#              #
#    Updated: 2025/06/10 03:40:37 by amaltea          ###   ########.fr        #
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
				main.o\
				math_utils.c\
				render.c

OBJS = $(SRCS:.c=.o)

CC = cc

CFLAGS = -Wall -Werror -Wextra -I./includes $(MLX_INC)

all: $(NAME)

$(MLX):
	make -C $(MLX_DIR)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(MLX_FLAGS) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all
