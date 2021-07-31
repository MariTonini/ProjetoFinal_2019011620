/*
 * File:   main.c
 * Author: Mariana Natalie Tonini de Melo - 2019011620
 */


#include "config.h"
#include "pic18f4520.h"
#include "lcd.h"
#include "delay.h"
#include <string.h>
#include "teclado.h"
#include "keypad.h"
#include "bits.h"
#include "ssd.h"
#include "pwm.h"
//variaveis globais
int unsigned delay = 250;
unsigned int atrasoMin = 20;
unsigned int atrasoMed = 150;
unsigned int atrasoMax = 1000;

//leds que serão acessos
int vetLed[7] = {0x80, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc, 0xfe};

//Anos com eventos imprtantes selecionados
int vetAnos[26] = {1922, 1929, 1930, 1932, 1934, 1937, 1939, 1940, 1945, 1953, 1954, 1960, 1964,
    1967, 1968, 1972, 1978, 1985, 1989, 1990, 2002, 2010, 2016, 2018, 2020, 2021};

//importancia selecionada para cada ano de 1 a 7
int vetImpLeds[26] = {2, 6, 5, 5, 4, 5, 7, 6, 7, 3, 3, 6, 7, 3, 7, 2, 6, 7, 3, 6, 2, 2, 6, 1, 7, 7};

int teclado() {
    //unsigned int num[12] = {10,7,4,1,0,8,5,2,15,9,6,3};
    unsigned int sequenciaTeclado[4];
    unsigned int a, b, c, d, ano1;
    unsigned int i, j;
    unsigned int tecla;
    /*kpInit();
    
    
    for (j=0;j<4; j++){             //Tentativa de funcionamento das teclas com a biblioteca "keypad.h"
      kpDebounce();                 //Sem funcionamento correto
      if (kpRead() != tecla) {          
            tecla = kpRead();
            for(i = 0; i < 12; i++){
                if (bitTst(tecla, i)){
                    sequenciaTeclado[j] = num[i];
                }
            }  
        }
    }*/
    
/*Tentativa de funcionamento das teclas de duas formas, deixei comentado uma maneira de fazer e utilizei a que esta
 sem os comentarios para os fins de teste do projeto(Não consegui faze-las retornar o valor correto das teclas pressionadas)*/
    
    for(int i = 0; i < 4; i++){ //ano com 4 posições
    //for (int i =3; i >= 0; i--) { // grava valores do teclado
        TRISD = 0x0F;
        tecla = tc_tecla(0) + 0x30; //soma 0x30 para forncecer valor correto da tecla no LCD
        //tecla = tc_tecla(i) + 0x30;
        //atraso_ms(atrasoMax*2);
        TRISD = 0x00;        
        lcd_dat(tecla); //imprime valor da tecla no LCD
        //aux = aux + (tecla - 0x30) * (10^i); //Transforma em um ano no formato aaaa
        //atraso_ms(atrasoMax*2);
        sequenciaTeclado[i] = tecla - 0x30;
    }
    //atraso_ms(atrasoMax);; 
    a = sequenciaTeclado[0] * 1000; //converte as teclas recebidas do vetor em um número inteiro
    b = sequenciaTeclado[1] * 100;
    c = sequenciaTeclado[2] * 10;
    d = sequenciaTeclado[3];
    ano1 = a + b + c + d;
    return ano1;
    //return aux;

}//end teclado

int verificaAno(int ano) {//Encontra o ano com os eventos importantes dentro do vetor estabelecido nas variaveis globais
    int ano2 = ano;
    for (int i = 0; i < 26; i++) {
        for (int j = 0; j < 26; j++) {
            if (ano == vetAnos[j]) {
                return ano;
            } else if (ano2 == vetAnos[j]) {
                return ano2;
            }
        }
        ano++;
        ano2--;
    }
}// end verificaAno

void acendeLed(int ano) {//liga os LEDs conforme a importancia do Ano
    TRISB = 0x00;
    PORTB = 0x00;
    int a = verificaAno(ano);
    int i, j;
    for (i = 0; i < 26; i++) {
        if (vetAnos[i] == a) {
            PORTB = vetLed[vetImpLeds[i] - 1];
        }
    }
}//end acendeLed   

void limpaTela() {//limpa a tela do LCD
    lcd_cmd(L_CLR);
    lcd_cmd(L_L1);
    lcd_cmd(L_CLR);
    lcd_cmd(L_L2);
    lcd_cmd(L_CLR);
    lcd_cmd(L_L3);
    lcd_cmd(L_CLR);
    lcd_cmd(L_L4);
}//end limpaTela

void fatos(char str[64]) {//Organiza e printa os fatos daquele ano conforme o display 16x4
    int i;
    char str1[17];
    char str2[17];
    char str3[17];
    char str4[17];
    str1[16] = '\0';
    str2[16] = '\0';
    str3[16] = '\0';
    str4[16] = '\0';

    limpaTela();
    if (strlen(str) > 16) {
        for (i = 0; i < strlen(str); i++) {
            if (str[i] == '\0') {
                i = strlen(str);
            } else if (i < 16) {
                str1[i] = str[i];
            } else if (i < 32) {
                str2[i - 16] = str[i];
            } else if (i < 48) {
                str3[i - 32] = str[i];
            } else if (i < 64) {
                str4[i - 48] = str[i];
            }
        }
        lcd_cmd(L_CLR);
        lcd_cmd(L_L1);
        lcd_str(str1);
        lcd_cmd(L_L2);
        lcd_str(str2);
        lcd_cmd(L_L3);
        lcd_str(str3);
        lcd_cmd(L_L4);
        lcd_str(str4);
    }
}//end fatos

void bancoDados(int ano) {//Banco de dados da linha do Tempo. Fatos importantes de cada ano escolhido no vetor de anos
    int a = verificaAno(ano);
    fatos("                                                                                                  ");
    switch (a) {
        case 1922:
            fatos("Fundacao do partido comunista do brasil");
            atraso_ms(atrasoMax);
            break;
        case 1929:
            fatos("Quebra da bolsa de valores de NY");
            atraso_ms(atrasoMax);
            break;
        case 1930:
            fatos("Inicio da Era Vargas");
            atraso_ms(atrasoMax);
            break;
        case 1932:
            fatos("Revolucao constitucionalista em Sao Paulo");
            atraso_ms(atrasoMax);
            break;
        case 1934:
            fatos("Promulgada a    Constituicao de 1934");
            atraso_ms(atrasoMax);
            break;
        case 1937:
            fatos("Implantacao do Estado Novo");
            atraso_ms(atrasoMax);
            break;
        case 1939:
            fatos("Inicio da segunda guerra mundial");
            atraso_ms(atrasoMax);
            break;
        case 1940:
            fatos("Instituicao do salario minimo");
            atraso_ms(atrasoMax);
            break;
        case 1945:
            fatos("Fundacao da ONU  ");
            atraso_ms(atrasoMax);
            fatos("Fim da Era      Vargas");
            atraso_ms(atrasoMax);
            fatos("Fim da segunda  guerra");
            atraso_ms(atrasoMax);
            fatos("Redemocratizacaodo Brasil");
            break;
        case 1953:
            fatos("Criacao da Petrobras");
            atraso_ms(atrasoMax);
            break;
        case 1954:
            fatos("Suicido de Getulio Vargas");
            atraso_ms(atrasoMax);
            break;
        case 1960:
            fatos("Brasilia inaugurada por Juscelino Kubitscheck");
            atraso_ms(atrasoMax);
            break;
        case 1964:
            fatos("Inicio ditaduta militar no brasil");
            atraso_ms(atrasoMed);
            fatos("Centenas de denuncias de casos de tortura");
            break;
        case 1967:
            fatos("Constituicao da ditatura militar");
            atraso_ms(atrasoMax);
            break;
        case 1968:
            fatos("Implantacao do AI-5");
            atraso_ms(atrasoMax);
            break;
        case 1972:
            fatos("Milagre enconomico, crescimento em 11,2 por cento");
            atraso_ms(atrasoMax);
            break;
        case 1978:
            fatos("Revogacao do AI-5 e de outros atos da ditadura");
            atraso_ms(atrasoMax);
            break;
        case 1985:
            fatos("Fim da ditadura militar");
            atraso_ms(atrasoMax);
            break;
        case 1989:
            fatos("Collor eleito presidente");
            atraso_ms(atrasoMax);
            break;
        case 1990:
            fatos("Congelamento de contas por Collor");
            atraso_ms(atrasoMax);
            break;

        case 2002:
            fatos("Brasil ganha a copa do mundo");
            atraso_ms(atrasoMax);
            fatos("Lula é eleito presidente da República");
            break;

        case 2010:
            fatos("Eleicao de Dilma Rousseff");
            atraso_ms(atrasoMax);
            break;

        case 2016:
            fatos("Impeachment de Dilma Rousseff");
            atraso_ms(atrasoMax);
            break;

        case 2018:
            fatos("Eleicao de Jair Bolsonaro");
            atraso_ms(atrasoMax);
            break;
        case 2020:
            fatos("Casos de        intoxicacao pelacerveja Backer");
            atraso_ms(atrasoMax);
            fatos("Instabilidade nogoverno, saude  e educacao     ");
            atraso_ms(atrasoMax);
            fatos("Casos de corona virus no Brasil com mais de     500000 mortes");
            break;
        case 2021:
            fatos("Lancamento do   primeiro satelite totalmente    brasileiro");
            atraso_ms(atrasoMax * 3);
            fatos("Crise sanitaria e governamental                           ");
            atraso_ms(atrasoMax * 2);
            fatos("inicio da       vacinacao no    Brasil                     ");
            atraso_ms(atrasoMax * 2);
            fatos("Chacina em      favela no RJ                               ");
            atraso_ms(atrasoMax * 2);
            fatos("Serial killer   procurado       durante 20 dias foi morto "); //
            atraso_ms(atrasoMax * 3);
            break;
    }
}//end bancoDados

void init() {//contem as instruções de inicialização do programa
    lcd_cmd(L_L2);
    lcd_str("      Bem");
    lcd_cmd(L_L3);
    lcd_str("     Vindo");
    atraso_ms(atrasoMax);

    fatos("Esta e a linha  do tempo dos    ultimos 100 anosdo Brasil");
    atraso_ms(atrasoMax * 2);

    lcd_cmd(L_CLR);
    lcd_cmd(L_L1);
    lcd_str("Insira o Ano:");
    lcd_cmd(L_L2);


}//end init

void main(void) {
    int i;
    int cooler;   
    
    ADCON1 = 0x06;
    TRISB = 0x01;
    TRISC = 0x00;
    TRISD = 0x00;
    TRISE = 0x00;
    TRISB = 0xF8;

    lcd_init();
    init();
    ssdInit();
    pwmInit();
    atraso_ms(atrasoMax);
    int ano = teclado();
    ano = 2023; //ano inicializado para fim de teste do projeto como um todo. Foi colocado um ano que não existe no vetor 
    int a = verificaAno(ano);                                                //para que fosse testado a função de verificação
    for (i = 0; i < 1000; i++) {       
        ssdDigit((a / 1000) % 10, 0); //Printa o ano correto no display de sete segmentos
        ssdDigit((a / 100) % 10, 1);
        ssdDigit((a / 10) % 10, 2);
        ssdDigit((a /1 )% 10, 3);    
        ssdUpdate();    
    }
    cooler = 95;
    while(cooler == 95){ //faz com que o cooler funcione enquanto os fatos aparecem no LCD
        pwmSet1(cooler);
        lcd_cmd(L_L1);
        lcd_cmd(L_CLR);
        lcd_cmd(L_L2);
        lcd_str("     Fatos");
        lcd_cmd(L_L3);
        lcd_str("   Ocorridos ");
        atraso_ms(atrasoMax);
        bancoDados(ano);
        atraso_ms(atrasoMax);
        fatos("Verifique a     importancia do  ano nos LEDs                ");
        acendeLed(ano);
        atraso_ms(atrasoMax * 2);
        limpaTela();
        lcd_cmd(L_L1);
        lcd_str("      Fim");
        cooler = 0;
        pwmSet1(cooler);
        lcd_cmd(L_L3);
        lcd_str("Desenvolvido Por");
        lcd_cmd(L_L4);
        lcd_str("Mariana Tonini");
        atraso_ms(atrasoMax * 5);    
    }//end while
    
}//end main