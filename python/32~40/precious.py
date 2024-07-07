import random
import os 
import numpy as np
# 게임 초기화
def initialize_game(n):
    tresure_position = (random.randint(0, n-1), random.randint(0, n-1))
    player_position=(0,0)
    return tresure_position,player_position

# 거리 계산
def calculate_distance(tresure_position, player_position):
    tresure_x,tresure_y=tresure_position
    player_x,player_y=player_position
    return abs(player_x-tresure_x) + abs(player_y-tresure_y)

# 플레이어 이동
def move_player(board_size, player_position, direction):
    x,y=player_position
    if direction=='w' and x>0:
        x-=1
    elif direction=='s' and x<board_size-1:
        x+=1
    elif direction=='a' and y>0:
        y-=1
    elif direction=='d' and y<board_size-1:
        y+=1
    else:
        print("W/A/S/D로 방향을 입력해주세요")
    return x,y
# 게임 실행
def play_game(board_size):
    while True:
        play=input("게임을 실행하시겠습니까?")
        if play=="예":
            print("게임을 시작합니다.")
            tresure_position, player_position = initialize_game(board_size)
            while True:
                print(f"플레이어의 현재 위치 : {player_position}")
                distance=calculate_distance(tresure_position,player_position)
                print(f"플레이어와 보물의 거리 : {distance}")
                if distance ==0:
                    print("보물찾기에 성공하였습니다!")
                    break
                direction=input("위/아래/왼쪽/오른쪽으로 이동하시려면 해당하는 키를 눌러주세요.")
                player_position=move_player(board_size, player_position, direction)
            
        elif play=="아니오":
            print("게임을 종료합니다.")
            break
        else:
            print("예/아니오로 답변해주세요.")
        

            
# 게임 보드 크기 설정 및 게임 시작
if __name__ == "__main__":
    board_size = 5  # 보드 크기를 5x5로 설정
    play_game(board_size)