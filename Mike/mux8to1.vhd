library ieee;
use ieee.std_logic_1164.all;

--using 4to1 and 2to1 as low level
entity mux8to1 is
	port (
		w : in std_logic_vector(0 to 7);
		s : in std_logic_vector(0 to 2);
		f : out std_logic
	);
end mux8to1;

architecture logic of mux8to1 is
	
	signal mux4_out0, mux4_out1 : std_logic;

	component mux4to1
		port (
			w0, w1, w2, w3, s0, s1 : in std_logic;
			f : out std_logic
		);
	end component;

	component mux2to1
		port (
			w0, w1, s : in std_logic;
			f : out std_logic
		);
	end component;
	
begin
	stage0 : mux4to1 port map(
		w0 => w(0),
		w1 => w(1),
		w2 => w(2),
		w3 => w(3),
		s0 => s(0),
		s1 => s(1),
		f => mux4_out0
	);
	
	stage1 : mux4to1 port map(
		w0 => w(4),
		w1 => w(5),
		w2 => w(6),
		w3 => w(7),
		s0 => s(0),
		s1 => s(1),
		f => mux4_out1
	);
	
	stage2 : mux2to1 port map(
		w0 => mux4_out0,
		w1 => mux4_out1,
		s => s(2),
		f => f
	);
	
end logic;