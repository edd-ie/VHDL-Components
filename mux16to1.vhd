library ieee;
use ieee.std_logic_1164.all;

--using 4to1 as low level
entity mux16to1 is
	port (
		w : in std_logic_vector(0 to 15);
		s : in std_logic_vector(0 to 3);
		f : out std_logic
	);
end mux16to1;

architecture logic of mux16to1 is

	signal mux4_out : std_logic_vector(0 to 3);
	
	component mux4to1
		port (
			w0, w1, w2, w3, s0, s1 : in std_logic;
			f : out std_logic
		);
	end component;
	
begin
	stage0 : mux4to1 port map (
		w0 => w(0),
		w1 => w(1),
		w2 => w(2),
		w3 => w(3),
		s0 => s(0),
		s1 => s(1),
		f => mux4_out(0)
	);
	
	stage1 : mux4to1 port map (
		w0 => w(4),
		w1 => w(5),
		w2 => w(6),
		w3 => w(7),
		s0 => s(0),
		s1 => s(1),
		f => mux4_out(1)
	);
	
	stage2 : mux4to1 port map (
		w0 => w(8),
		w1 => w(9),
		w2 => w(10),
		w3 => w(11),
		s0 => s(0),
		s1 => s(1),
		f => mux4_out(2)
	);
	
	stage3 : mux4to1 port map (
		w0 => w(12),
		w1 => w(13),
		w2 => w(14),
		w3 => w(15),
		s0 => s(0),
		s1 => s(1),
		f => mux4_out(3)
	);
	
	stage4 : mux4to1 port map (
		w0 => mux4_out(0),
		w1 => mux4_out(1),
		w2 => mux4_out(2),
		w3 => mux4_out(3),
		s0 => s(2),
		s1 => s(3),
		f => f
	);
	
end logic;