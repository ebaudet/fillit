# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/05/14 12:35:00 by ebaudet           #+#    #+#              #
#    Updated: 2014/05/18 23:27:30 by ebaudet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= fillit

PGM		= fillit
FILES	= fillit.c
SRC		= $(addprefix srcs/, $(FILES))
OBJ		= $(SRC:srcs/%.c=.obj/%.o)

INC		= -I includes -I libft/includes
FLAGS	= -Wall -Wextra -Werror
LIB		= -L libft -lft
CC		= gcc

all: $(NAME)

$(NAME): make_libft $(OBJ)
	$(CC) $(FLAGS) $(OBJ) -o $(NAME) $(INC) $(LIB)

.obj/%.o: srcs/%.c
	@mkdir -p .obj
	$(CC) -c $< -o $@ $(FLAGS) $(INC)

make_libft:
	@echo "Compilation de la libft :"
	@make -C libft

clean:
	rm -rf .obj

fclean: clean
	rm -f $(NAME)

re: fclean all

gdb: make_libft
	cc -g $(FLAGS) $(SRC) -o $(NAME) $(INC) $(LIB)

.PHONY: all clean fclean re gdb
