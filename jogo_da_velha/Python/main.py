import time, sys

def reset():
    global possivel, simb, player
    possivel = "123456789"
    simb, player = "x", "1"


def teste_vencedor():
    winner = "nenhum"
    for c in range(0, 6+1):
        match c:
            case 0 | 3 | 6:
                if possivel[c] == possivel[c+1] == possivel[c+2]:
                    winner = player
                elif c == 0:
                    if possivel[c] == possivel[c+4] == possivel[c+8]:
                        winner = player
                    elif possivel[c] == possivel[c+3] == possivel[c+6]:
                        winner = player
            case 1 | 2:
                if possivel[c] == possivel[c+3] == possivel[c+6]:
                    winner = player
                elif c == 2 and possivel[c] == possivel[c+2] == possivel[c+4]:
                    winner = player
        
        if c == 6 and possivel.count("x") == 5:
            winner = "velha"
    return winner


possivel, player, simb = "123456789", "1", "x"

def printar():
    print(f""" {possivel[0]} | {possivel[1]} | {possivel[2]} 
---+---+---
 {possivel[3]} | {possivel[4]} | {possivel[5]} 
---+---+---
 {possivel[6]} | {possivel[7]} | {possivel[8]} """)


while True:
    printar()
    pos = str(input(f"Digite uma posição jogador{player}: "))

    if pos.isnumeric():
        if pos in possivel and 0 < int(pos) < 10:
            possivel = possivel.replace(pos, simb)
        else:
            print("Digite um valor válido!")
            time.sleep(0.3)
            continue
    else:
        print("Digite um valor válido!")
        time.sleep(0.3)
        continue
    
    vencedor = teste_vencedor()
    if vencedor == "velha":
        print("Deu velha fiote")
    elif not vencedor == "nenhum":
        printar()
        for j in f"Parabéns jogador{vencedor}!\nVocê venceu\n":
            sys.stdout.write(j)
            sys.stdout.flush()
            time.sleep(0.08)

        while True:
            esc = str(input("Deseja jogar mais uma vez? [S/N]")).strip().lower()[0]
            if esc == "s" or esc == "n":
                break
            else:
                print("Valor inválido!")

        if esc == "s":
            reset()
            continue
        else:
            break

    if player == "1":
        player, simb = "2", "O"
    else:
        player, simb = "1", "x"
