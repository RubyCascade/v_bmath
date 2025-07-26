// An implementation of saturation arithmetic
// and other error mitigation functions
//
// https://en.wikipedia.org/wiki/Saturation_arithmetic


module bmath


// UNSIGNED

// Unsigned saturation addition

pub fn addu8(a u8, b u8) u8 {
	c := a + b
	if c < a {
		return max_u8
	} else {
		return c
	}
}

pub fn addu16(a u16, b u16) u16 {
	c := a + b
	if c < a {
		return max_u16
	} else {
		return c
	}
}

pub fn addu32(a u32, b u32) u32 {
	c := a + b
	if c < a {
		return max_u32
	} else {
		return c
	}
}

pub fn addu64(a u64, b u64) u64 {
	c := a + b
	if c < a {
		return max_u64
	} else {
		return c
	}
}


// Unsigned saturation subtraction

pub fn subu8(a u8, b u8) u8 {
	c := a - b
	if c > a {
		return 0
	} else {
		return c
	}
}

pub fn subu16(a u16, b u16) u16 {
	c := a - b
	if c > a {
		return 0
	} else {
		return c
	}
}

pub fn subu32(a u32, b u32) u32 {
	c := a - b
	if c > a {
		return 0
	} else {
		return c
	}
}

pub fn subu64(a u64, b u64) u64 {
	c := a - b
	if c > a {
		return 0
	} else {
		return c
	}
}


// Unsigned saturation multiplication

pub fn multu8(a u8, b u8) u8 {
	c := a * b
	if a != 0 && c / a != b {
		return max_u8
	} else {
		return c
	}
}

pub fn multu16(a u16, b u16) u16 {
	c := a * b
	if a != 0 && c / a != b {
		return max_u16
	} else {
		return c
	}
}

pub fn multu32(a u32, b u32) u32 {
	c := a * b
	if a != 0 && c / a != b {
		return max_u32
	} else {
		return c
	}
}

pub fn multu64(a u64, b u64) u64 {
	c := a * b
	if a != 0 && c / a != b {
		return max_u64
	} else {
		return c
	}
}


// Unsigned division by zero // x / 0 == 0
// normally returns an error

pub fn divu8(a u8, b u8) u8 {
	if b == 0 {
		return 0
	} else {
		return a / b
	}
}

pub fn divu16(a u16, b u16) u16 {
	if b == 0 {
		return 0
	} else {
		return a / b
	}
}

pub fn divu32(a u32, b u32) u32 {
	if b == 0 {
		return 0
	} else {
		return a / b
	}
}

pub fn divu64(a u64, b u64) u64 {
	if b == 0 {
		return 0
	} else {
		return a / b
	}
}


// Unsigned modulo by zero // x % 0 == x
// normally returns an error

pub fn modu8(a u8, b u8) u8 {
	if b == 0 {
		return a
	} else {
		return a % b
	}
}

pub fn modu16(a u16, b u16) u16 {
	if b == 0 {
		return a
	} else {
		return a % b
	}
}

pub fn modu32(a u32, b u32) u32 {
	if b == 0 {
		return a
	} else {
		return a % b
	}
}

pub fn modu64(a u64, b u64) u64 {
	if b == 0 {
		return a
	} else {
		return a % b
	}
}



// SIGNED

// Absolute value // bmath.absix(min_ix) == max_ix
// normally the math.abs() implementation will return min_ix if the input is min_ix iirc

pub fn absi8(a i8) i8 {
	if a < 0 {
		if a == min_i8 {
			return max_i8
		} else {
			return a * -1
		}
	} else {
		return a
	}
}

pub fn absi16(a i16) i16 {
	if a < 0 {
		if a == min_i16 {
			return max_i16
		} else {
			return a * -1
		}
	} else {
		return a
	}
}

pub fn absi32(a i32) i32 {
	if a < 0 {
		if a == min_i32 {
			return max_i32
		} else {
			return a * -1
		}
	} else {
		return a
	}
}

pub fn absi64(a i64) i64 {
	if a < 0 {
		if a == min_i64 {
			return max_i64
		} else {
			return a * -1
		}
	} else {
		return a
	}
}


// Signed saturation addition

pub fn addi8(a i8, b i8) i8 {
	c := a + b
	aa := absi8(a)
	ba := absi8(b)
	if (a == aa && b != ba) || (a != aa && b == ba) {
		return c
	} else {
		if a == aa && c < a {
			return max_i8
		} else if a != aa && c > a {
			return min_i8
		} else {
			return c
		}
	}
}

pub fn addi16(a i16, b i16) i16 {
	c := a + b
	aa := absi16(a)
	ba := absi16(b)
	if (a == aa && b != ba) || (a != aa && b == ba) {
		return c
	} else {
		if a == aa && c < a {
			return max_i16
		} else if a != aa && c > a {
			return min_i16
		} else {
			return c
		}
	}
}

pub fn addi32(a i32, b i32) i32 {
	c := a + b
	aa := absi32(a)
	ba := absi32(b)
	if (a == aa && b != ba) || (a != aa && b == ba) {
		return c
	} else {
		if a == aa && c < a {
			return max_i32
		} else if a != aa && c > a {
			return min_i32
		} else {
			return c
		}
	}
}

pub fn addi64(a i64, b i64) i64 {
	c := a + b
	aa := absi64(a)
	ba := absi64(b)
	if (a == aa && b != ba) || (a != aa && b == ba) {
		return c
	} else {
		if a == aa && c < a {
			return max_i64
		} else if a != aa && c > a {
			return min_i64
		} else {
			return c
		}
	}
}


// Signed saturation subtraction

pub fn subi8(a i8, b i8) i8 {
	c := a - b
	aa := absi8(a)
	ba := absi8(b)
	if (a == aa && b == ba) || (a != aa && b != ba) {
		return c
	} else {
		if a == aa && c < a {
			return max_i8
		} else if a != aa && c > a {
			return min_i8
		} else {
			return c
		}
	}
}

pub fn subi16(a i16, b i16) i16 {
	c := a - b
	aa := absi16(a)
	ba := absi16(b)
	if (a == aa && b == ba) || (a != aa && b != ba) {
		return c
	} else {
		if a == aa && c < a {
			return max_i16
		} else if a != aa && c > a {
			return min_i16
		} else {
			return c
		}
	}
}

pub fn subi32(a i32, b i32) i32 {
	c := a - b
	aa := absi32(a)
	ba := absi32(b)
	if (a == aa && b == ba) || (a != aa && b != ba) {
		return c
	} else {
		if a == aa && c < a {
			return max_i32
		} else if a != aa && c > a {
			return min_i32
		} else {
			return c
		}
	}
}

pub fn subi64(a i64, b i64) i64 {
	c := a - b
	aa := absi64(a)
	ba := absi64(b)
	if (a == aa && b == ba) || (a != aa && b != ba) {
		return c
	} else {
		if a == aa && c < a {
			return max_i64
		} else if a != aa && c > a {
			return min_i64
		} else {
			return c
		}
	}
}


// Signed saturation multiplication

pub fn multi8(a i8, b i8) i8 {
	c := a * b
	aa := absi8(a)
	ba := absi8(b)
	if a != 0 && c / a != b {
		if (a == aa && b == ba) || (a != aa && b != ba) {
			return max_i8
		} else {
			return min_i8
		}
	} else {
		return c
	}
}

pub fn multi16(a i16, b i16) i16 {
	c := a * b
	aa := absi16(a)
	ba := absi16(b)
	if a != 0 && c / a != b {
		if (a == aa && b == ba) || (a != aa && b != ba) {
			return max_i16
		} else {
			return min_i16
		}
	} else {
		return c
	}
}

pub fn multi32(a i32, b i32) i32 {
	c := a * b
	aa := absi32(a)
	ba := absi32(b)
	if a != 0 && c / a != b {
		if (a == aa && b == ba) || (a != aa && b != ba) {
			return max_i32
		} else {
			return min_i32
		}
	} else {
		return c
	}
}

pub fn multi64(a i64, b i64) i64 {
	c := a * b
	aa := absi64(a)
	ba := absi64(b)
	if a != 0 && c / a != b {
		if (a == aa && b == ba) || (a != aa && b != ba) {
			return max_i64
		} else {
			return min_i64
		}
	} else {
		return c
	}
}


// Signed division by zero // x / 0 == 0
// normally returns an error

pub fn divi8(a i8, b i8) i8 {
	if b == 0 {
		return 0
	} else {
		return a / b
	}
}

pub fn divi16(a i16, b i16) i16 {
	if b == 0 {
		return 0
	} else {
		return a / b
	}
}

pub fn divi32(a i32, b i32) i32 {
	if b == 0 {
		return 0
	} else {
		return a / b
	}
}

pub fn divi64(a i64, b i64) i64 {
	if b == 0 {
		return 0
	} else {
		return a / b
	}
}


// signed modulo by zero // x % 0 == x
// normally returns an error

pub fn modi8(a i8, b i8) i8 {
	if b == 0 {
		return a
	} else {
		return a % b
	}
}

pub fn modi16(a i16, b i16) i16 {
	if b == 0 {
		return a
	} else {
		return a % b
	}
}

pub fn modi32(a i32, b i32) i32 {
	if b == 0 {
		return a
	} else {
		return a % b
	}
}

pub fn modi64(a i64, b i64) i64 {
	if b == 0 {
		return a
	} else {
		return a % b
	}
}

