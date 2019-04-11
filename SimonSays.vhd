library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my.all;

ENTITY TOP IS
PORT(
CLK: IN STD_LOGIC;
RESET: IN STD_LOGIC;
Rin: IN STD_LOGIC;
Gin: IN STD_LOGIC;
Bin: IN STD_LOGIC;
Yin: IN STD_LOGIC;
ROUT, GOUT, BOUT, YOUT: OUT STD_LOGIC;
);
END TOP;

ARCHITECTURE MAIN OF TOP IS
SIGNAL KEY:STD_LOGIC_VECTOR(19 downto 0);
SIGNAL STATE:STD_LOGIC_VECTOR(3 downto 0);
SIGNAL PLLSIG:STD_LOGIC;
SIGNAL COUNTER:STD_LOGIC_VECTOR(19 downto 0);
SIGNAL INPUT:STD_LOGIC_VECTOR(1 downto 0);
SIGNAL BREAK:STD_LOGIC;


initial KEY = "00000000000000000000";
initial COUNTER = "00000000000000000000";
initial BREAK = "0";
component pll is
		port (
			clk_in_clk  : in  std_logic := 'X'; -- clk
			reset_reset : in  std_logic := 'X'; -- reset
			clk_out_clk : out std_logic         -- clk
		);
end component pll;

BEGIN
PROCESS(reset,r,g,b,y)
BEGIN
if(reset) then 
State = "0000";
Else
Case STATE is

When "0000"
	
	if(KEY(19 downto 18) == "00") then R = '1';
	elsif(KEY(19 downto 18) == "01") then G = '1';
	elsif(KEY(19 downto 18) == "10") then B = '1';
	elsif(KEY(19 downto 18) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';

	--Wait for input component, Feed bit for button and populate two bit INPUT array with the proper value
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;

	if(INPUT == KEY(19 downto 18)) then STATE = STATE + 1;
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;

When "0001"

	if(KEY(19 downto 18) == "00") then R = '1';
	elsif(KEY(19 downto 18) == "01") then G = '1';
	elsif(KEY(19 downto 18) == "10") then B = '1';
	elsif	(KEY(19 downto 18) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';

	if(KEY(17 downto 16) == "00") then R = '1';
	elsif(KEY(17 downto 16) == "01") then G = '1';
	elsif(KEY(17 downto 16) == "10") then B = '1';
	elsif	(KEY(17 downto 16) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	
	--Wait for input component, Feed bit for button and populate two bit INPUT array with the proper value
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT /= KEY(19 downto 18)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	if(INPUT == KEY(17 downto 16)) then STATE = STATE + 1;
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUTNER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
When "0010"

	if(KEY(19 downto 18) == "00") then R = '1';
	elsif(KEY(19 downto 18) == "01") then G = '1';
	elsif(KEY(19 downto 18) == "10") then B = '1';
	elsif	(KEY(19 downto 18) == "11") then Y = '1';
	end if
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';

	if(KEY(17 downto 16) == "00") then R = '1';
	elsif(KEY(17 downto 16) == "01") then G = '1';
	elsif(KEY(17 downto 16) == "10") then B = '1';
	elsif	(KEY(17 downto 16) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(15 downto 14) == "00") then R = '1';
	elsif(KEY(15 downto 14) == "01") then G = '1';
	elsif(KEY(15 downto 14) == "10") then B = '1';
	elsif	(KEY(15 downto 14) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	--Wait for input component, Feed bit for button and populate two bit INPUT array with the proper value
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT /= KEY(19 downto 18)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	if(INPUT /= KEY(17 downto 16)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
		--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	
	if(INPUT == KEY(15 downto 14)) then STATE = STATE + 1;
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;

When "0011"

	if(KEY(19 downto 18) == "00") then R = '1';
	elsif(KEY(19 downto 18) == "01") then G = '1';
	elsif(KEY(19 downto 18) == "10") then B = '1';
	elsif	(KEY(19 downto 18) == "11") then Y = '1';
	end if
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';

	if(KEY(17 downto 16) == "00") then R = '1';
	elsif(KEY(17 downto 16) == "01") then G = '1';
	elsif(KEY(17 downto 16) == "10") then B = '1';
	elsif	(KEY(17 downto 16) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(15 downto 14) == "00") then R = '1';
	elsif(KEY(15 downto 14) == "01") then G = '1';
	elsif(KEY(15 downto 14) == "10") then B = '1';
	elsif	(KEY(15 downto 14) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(13 downto 12) == "00") then R = '1';
	elsif(KEY(13 downto 12) == "01") then G = '1';
	elsif(KEY(13 downto 12) == "10") then B = '1';
	elsif	(KEY(13 downto 12) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	--Wait for input component, Feed bit for button and populate two bit INPUT array with the proper value
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT /= KEY(19 downto 18)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	if(INPUT /= KEY(17 downto 16)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
		--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	
	if(INPUT /= KEY(15 downto 14)) then 
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT == KEY(13 downto 12)) then STATE = STATE + 1;
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	

When "0100"

	if(KEY(19 downto 18) == "00") then R = '1';
	elsif(KEY(19 downto 18) == "01") then G = '1';
	elsif(KEY(19 downto 18) == "10") then B = '1';
	elsif	(KEY(19 downto 18) == "11") then Y = '1';
	end if
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';

	if(KEY(17 downto 16) == "00") then R = '1';
	elsif(KEY(17 downto 16) == "01") then G = '1';
	elsif(KEY(17 downto 16) == "10") then B = '1';
	elsif	(KEY(17 downto 16) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(15 downto 14) == "00") then R = '1';
	elsif(KEY(15 downto 14) == "01") then G = '1';
	elsif(KEY(15 downto 14) == "10") then B = '1';
	elsif	(KEY(15 downto 14) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(13 downto 12) == "00") then R = '1';
	elsif(KEY(13 downto 12) == "01") then G = '1';
	elsif(KEY(13 downto 12) == "10") then B = '1';
	elsif	(KEY(13 downto 12) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(11 downto 10) == "00") then R = '1';
	elsif(KEY(11 downto 10) == "01") then G = '1';
	elsif(KEY(11 downto 10) == "10") then B = '1';
	elsif	(KEY(11 downto 10) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	--Wait for input component, Feed bit for button and populate two bit INPUT array with the proper value
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT /= KEY(19 downto 18)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	if(INPUT /= KEY(17 downto 16)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
		--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	
	if(INPUT /= KEY(15 downto 14)) then 
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT /= KEY(13 downto 12)) then 
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT == KEY(11 downto 10)) then STATE = STATE + 1;
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;

When "0101"

	if(KEY(19 downto 18) == "00") then R = '1';
	elsif(KEY(19 downto 18) == "01") then G = '1';
	elsif(KEY(19 downto 18) == "10") then B = '1';
	elsif	(KEY(19 downto 18) == "11") then Y = '1';
	end if
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';

	if(KEY(17 downto 16) == "00") then R = '1';
	elsif(KEY(17 downto 16) == "01") then G = '1';
	elsif(KEY(17 downto 16) == "10") then B = '1';
	elsif	(KEY(17 downto 16) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(15 downto 14) == "00") then R = '1';
	elsif(KEY(15 downto 14) == "01") then G = '1';
	elsif(KEY(15 downto 14) == "10") then B = '1';
	elsif	(KEY(15 downto 14) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(13 downto 12) == "00") then R = '1';
	elsif(KEY(13 downto 12) == "01") then G = '1';
	elsif(KEY(13 downto 12) == "10") then B = '1';
	elsif	(KEY(13 downto 12) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(11 downto 10) == "00") then R = '1';
	elsif(KEY(11 downto 10) == "01") then G = '1';
	elsif(KEY(11 downto 10) == "10") then B = '1';
	elsif	(KEY(11 downto 10) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	if(KEY(9 downto 8) == "00") then R = '1';
	elsif(KEY(9 downto 8) == "01") then G = '1';
	elsif(KEY(9 downto 8) == "10") then B = '1';
	elsif	(KEY(9 downto 8) == "11") then Y = '1';
	end if;
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	
	--Wait for input component, Feed bit for button and populate two bit INPUT array with the proper value
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT /= KEY(19 downto 18)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	if(INPUT /= KEY(17 downto 16)) then
	else
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
		--Wait for input component
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';

	
	if(INPUT /= KEY(15 downto 14)) then 
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT /= KEY(13 downto 12)) then 
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT /= KEY(11 downto 10)) then 
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;

	while(break == '0') loop
	if(Rin == '1') then
	input = "00";
	break = '1';
	elsif(Gin == '1') then
	input = "01";
	break = '1';
	elsif(Bin == '1') then
	input = "10";
	break = '1';
	elsif(Yin == '1') then
	input = "11";
	break = '1';
	end if;
	end loop;
	break = '0';
	
	if(INPUT == KEY(9 downto 8)) then STATE = STATE + 1;
	else 
	STATE = 0;
	Rin = '1';
	Gin = '1';
	Bin = '1';
	Yin = '1';
	while(COUNTER < "11110100001001000000") loop
	process(PLLSIG)
	Begin
	COUNTER = COUNTER + 1;
	End
	end loop
	COUNTER = "00000000000000000000";
	Rin = '0';
	Gin = '0';
	Bin = '0';
	Yin = '0';
	STATE = "0000";
	end if;
	
When "0110"

When "0111"

When "1000"

When "1001"

when others state = "0000";
end case;



END COMPONENT SYNC;