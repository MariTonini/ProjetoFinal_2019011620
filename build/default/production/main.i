# 1 "main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.35/packs/Microchip/PIC18Fxxxx_DFP/1.2.26/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "main.c" 2






# 1 "./config.h" 1
# 38 "./config.h"
#pragma config MCLRE=ON
#pragma config OSC=HS
#pragma config WDT=OFF
#pragma config LVP=OFF
#pragma config DEBUG = OFF
#pragma config WDTPS = 1
# 7 "main.c" 2

# 1 "./pic18f4520.h" 1
# 8 "main.c" 2

# 1 "./lcd.h" 1
# 16 "./lcd.h"
void lcd_init(void);
void lcd_cmd(unsigned char val);
void lcd_dat(unsigned char val);
void lcd_str(const char* str);
# 9 "main.c" 2

# 1 "./delay.h" 1



void atraso_ms(int t);
# 10 "main.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\string.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\string.h" 2 3






# 1 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\features.h" 1 3
# 10 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\string.h" 2 3
# 25 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\string.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 122 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned size_t;
# 168 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __int24 int24_t;
# 204 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef __uint24 uint24_t;
# 411 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef struct __locale_struct * locale_t;
# 25 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\string.h" 2 3


void *memcpy (void *restrict, const void *restrict, size_t);
void *memmove (void *, const void *, size_t);
void *memset (void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void *memchr (const void *, int, size_t);

char *strcpy (char *restrict, const char *restrict);
char *strncpy (char *restrict, const char *restrict, size_t);

char *strcat (char *restrict, const char *restrict);
char *strncat (char *restrict, const char *restrict, size_t);

int strcmp (const char *, const char *);
int strncmp (const char *, const char *, size_t);

int strcoll (const char *, const char *);
size_t strxfrm (char *restrict, const char *restrict, size_t);

char *strchr (const char *, int);
char *strrchr (const char *, int);

size_t strcspn (const char *, const char *);
size_t strspn (const char *, const char *);
char *strpbrk (const char *, const char *);
char *strstr (const char *, const char *);
char *strtok (char *restrict, const char *restrict);

size_t strlen (const char *);

char *strerror (int);
# 65 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\string.h" 3
char *strtok_r (char *restrict, const char *restrict, char **restrict);
int strerror_r (int, char *, size_t);
char *stpcpy(char *restrict, const char *restrict);
char *stpncpy(char *restrict, const char *restrict, size_t);
size_t strnlen (const char *, size_t);
char *strdup (const char *);
char *strndup (const char *, size_t);
char *strsignal(int);
char *strerror_l (int, locale_t);
int strcoll_l (const char *, const char *, locale_t);
size_t strxfrm_l (char *restrict, const char *restrict, size_t, locale_t);




void *memccpy (void *restrict, const void *restrict, int, size_t);
# 11 "main.c" 2

# 1 "./teclado.h" 1







    unsigned char tc_tecla(unsigned int timeout);
# 12 "main.c" 2

# 1 "./keypad.h" 1
# 13 "main.c" 2

# 1 "./bits.h" 1
# 14 "main.c" 2

# 1 "./ssd.h" 1
# 22 "./ssd.h"
 void ssdDigit(char val, char pos);
 void ssdUpdate(void);
 void ssdInit(void);
# 15 "main.c" 2

# 1 "./pwm.h" 1
# 23 "./pwm.h"
 void pwmSet1(unsigned char porcento);
 void pwmSet2(unsigned char porcento);
 void pwmFrequency(unsigned int freq);
 void pwmInit(void);
# 16 "main.c" 2


int unsigned delay = 250;
unsigned int atrasoMin = 20;
unsigned int atrasoMed = 150;
unsigned int atrasoMax = 1000;


int vetLed[7] = {0x80, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc, 0xfe};


int vetAnos[26] = {1922, 1929, 1930, 1932, 1934, 1937, 1939, 1940, 1945, 1953, 1954, 1960, 1964,
    1967, 1968, 1972, 1978, 1985, 1989, 1990, 2002, 2010, 2016, 2018, 2020, 2021};


int vetImpLeds[26] = {2, 6, 5, 5, 4, 5, 7, 6, 7, 3, 3, 6, 7, 3, 7, 2, 6, 7, 3, 6, 2, 2, 6, 1, 7, 7};

int teclado() {

    unsigned int sequenciaTeclado[4];
    unsigned int a, b, c, d, ano1;
    unsigned int i, j;
    unsigned int tecla;
# 57 "main.c"
    for(int i = 0; i < 4; i++){

        (*(volatile __near unsigned char*)0xF95) = 0x0F;
        tecla = tc_tecla(0) + 0x30;


        (*(volatile __near unsigned char*)0xF95) = 0x00;
        lcd_dat(tecla);


        sequenciaTeclado[i] = tecla - 0x30;
    }

    a = sequenciaTeclado[0] * 1000;
    b = sequenciaTeclado[1] * 100;
    c = sequenciaTeclado[2] * 10;
    d = sequenciaTeclado[3];
    ano1 = a + b + c + d;
    return ano1;


}

int verificaAno(int ano) {
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
}

void acendeLed(int ano) {
    (*(volatile __near unsigned char*)0xF93) = 0x00;
    (*(volatile __near unsigned char*)0xF81) = 0x00;
    int a = verificaAno(ano);
    int i, j;
    for (i = 0; i < 26; i++) {
        if (vetAnos[i] == a) {
            (*(volatile __near unsigned char*)0xF81) = vetLed[vetImpLeds[i] - 1];
        }
    }
}

void limpaTela() {
    lcd_cmd(0x01);
    lcd_cmd(0x80);
    lcd_cmd(0x01);
    lcd_cmd(0xC0);
    lcd_cmd(0x01);
    lcd_cmd(0x90);
    lcd_cmd(0x01);
    lcd_cmd(0xD0);
}

void fatos(char str[64]) {
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
        lcd_cmd(0x01);
        lcd_cmd(0x80);
        lcd_str(str1);
        lcd_cmd(0xC0);
        lcd_str(str2);
        lcd_cmd(0x90);
        lcd_str(str3);
        lcd_cmd(0xD0);
        lcd_str(str4);
    }
}

void bancoDados(int ano) {
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
            fatos("Serial killer   procurado       durante 20 dias foi morto ");
            atraso_ms(atrasoMax * 3);
            break;
    }
}

void init() {
    lcd_cmd(0xC0);
    lcd_str("      Bem");
    lcd_cmd(0x90);
    lcd_str("     Vindo");
    atraso_ms(atrasoMax);

    fatos("Esta e a linha  do tempo dos    ultimos 100 anosdo Brasil");
    atraso_ms(atrasoMax * 2);

    lcd_cmd(0x01);
    lcd_cmd(0x80);
    lcd_str("Insira o Ano:");
    lcd_cmd(0xC0);


}

void main(void) {
    int i;
    int cooler;

    (*(volatile __near unsigned char*)0xFC1) = 0x06;
    (*(volatile __near unsigned char*)0xF93) = 0x01;
    (*(volatile __near unsigned char*)0xF94) = 0x00;
    (*(volatile __near unsigned char*)0xF95) = 0x00;
    (*(volatile __near unsigned char*)0xF96) = 0x00;
    (*(volatile __near unsigned char*)0xF93) = 0xF8;

    lcd_init();
    init();
    ssdInit();
    pwmInit();
    atraso_ms(atrasoMax);
    int ano = teclado();
    ano = 2023;
    int a = verificaAno(ano);
    for (i = 0; i < 1000; i++) {
        ssdDigit((a / 1000) % 10, 0);
        ssdDigit((a / 100) % 10, 1);
        ssdDigit((a / 10) % 10, 2);
        ssdDigit((a /1 )% 10, 3);
        ssdUpdate();
    }
    cooler = 95;
    while(cooler == 95){
        pwmSet1(cooler);
        lcd_cmd(0x80);
        lcd_cmd(0x01);
        lcd_cmd(0xC0);
        lcd_str("     Fatos");
        lcd_cmd(0x90);
        lcd_str("   Ocorridos ");
        atraso_ms(atrasoMax);
        bancoDados(ano);
        atraso_ms(atrasoMax);
        fatos("Verifique a     importancia do  ano nos LEDs                ");
        acendeLed(ano);
        atraso_ms(atrasoMax * 2);
        limpaTela();
        lcd_cmd(0x80);
        lcd_str("      Fim");
        cooler = 0;
        pwmSet1(cooler);
        lcd_cmd(0x90);
        lcd_str("Desenvolvido Por");
        lcd_cmd(0xD0);
        lcd_str("Mariana Tonini");
        atraso_ms(atrasoMax * 5);
    }

}
