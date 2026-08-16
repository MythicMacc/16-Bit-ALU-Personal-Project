module OutputMUX(
	input [3:0]S,
	input [15:0]ADDR,SUBR,ANDO,ORO,XORO,NOT_A,NANDO,NORO,SLLR,SRLR,SRAR,IAR,DAR,PAR,PBR,SLTR,
	output [15:0]p
);

wire [15:0]ADDRC,SUBRC,ANDOC,OROC,XOROC,NOT_AC,NANDOC,NOROC,SLLRC,SRLRC,SRARC,IARC,DARC,PARC,PBRC,SLTRC;
wire [15:0]ADDRS,SUBRS,ANDOS,OROS,XOROS,NOT_AS,NANDOS,NOROS,SLLRS,SRLRS,SRARS,IARS,DARS,PARS,PBRS,SLTRS;
wire [15:0]ADDRR,SUBRR,ANDOR,OROR,XOROR,NOT_AR,NANDOR,NOROR,SLLRR,SRLRR,SRARR,IARR,DARR,PARR,PBRR,SLTRR;

OperationSelectDecoder OSD(S,ADDRC,SUBRC,ANDOC,OROC,XOROC,NOT_AC,
NANDOC,NOROC,SLLRC,SRLRC,SRARC,IARC,DARC,PARC,PBRC,SLTRC);

//Sixteen Bit Conversion Logic
oneToSixteenBit bc1(ADDRC,ADDRS);
oneToSixteenBit bc2(SUBRC,SUBRS);
oneToSixteenBit bc3(ANDOC,ANDOS);
oneToSixteenBit bc4(OROC,OROS);
oneToSixteenBit bc5(XOROC,XOROS);
oneToSixteenBit bc6(NOT_AC,NOT_AS);
oneToSixteenBit bc7(NANDOC,NANDOS);
oneToSixteenBit bc8(NOROC,NOROS);
oneToSixteenBit bc9(SLLRC,SLLRS);
oneToSixteenBit bc10(SRLRC,SRLRS);
oneToSixteenBit bc11(SRARC,SRARS);
oneToSixteenBit bc12(IARC,IARS);
oneToSixteenBit bc13(DARC,DARS);
oneToSixteenBit bc14(PARC,PARS);
oneToSixteenBit bc15(PBRC,PBRS);
oneToSixteenBit bc16(SLTRC,SLTRS);
	
//Combination AND Logic
assign ADDRR = ADDRS & ADDR;
assign SUBRR = SUBRS & SUBR;
assign ANDOR = ANDOS & ANDO;
assign OROR = OROS & ORO;
assign XOROR = XOROS & XORO;
assign NOT_AR = NOT_AS & NOT_A;
assign NANDOR = NANDOS & NANDO;
assign NOROR = NOROS & NORO;
assign SLLRR = SLLRS & SLLR;
assign SRLRR = SRLRS & SRLR;
assign SRARR = SRARS & SRAR;
assign IARR = IARS & IAR;
assign DARR = DARS & DAR;
assign PARR = PARS & PAR;
assign PBRR = PBRS & PBR;
assign SLTRR = SLTRS & SLTR;
	
//Pass Result Logic

assign p = ADDRR | SUBRR | ANDOR | OROR | XOROR | NOT_AR | NANDOR | NOROR | SLLRR | SRLRR | 
			  SRARR | IARR | DARR | PARR | PBRR | SLTRR;
	
endmodule