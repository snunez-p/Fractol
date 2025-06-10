/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   putstr_fd.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amaltea <amaltea@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/05 06:19:45 by amaltea           #+#    #+#             */
/*   Updated: 2025/06/10 13:41:42 by amaltea          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fractol.h"

void	putstr_fd(char *s, int fd)
{
	ssize_t	written;

	if (s == NULL || fd < 0)
		return ;
	while (*s)
	{
		written = write(fd, s, 1);
		if (written == -1)
			return ;
		s++;
	}
}
