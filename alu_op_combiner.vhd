library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_op_combiner is
	port (
		op_add_in, op_sub_in, op_mul_in, op_div_in,
		op_and_in, op_or_in, op_shr_in, op_shl_in,
		op_ror_in, op_rol_in, op_not_in, op_negate_in: in std_logic_vector(63 downto 0);
		C_out : out std_logic_vector(63 downto 0)
	);
end alu_op_combiner;

architecture behavior of alu_op_combiner is

begin
	 C_out <= (op_add_in or op_sub_in or op_mul_in or op_div_in
		or op_and_in or op_or_in or op_shr_in or op_shl_in
		or op_ror_in or op_rol_in or op_not_in or op_negate_in);
end architecture;