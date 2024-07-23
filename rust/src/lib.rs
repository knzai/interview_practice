// answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
// answer[i] == "Fizz" if i is divisible by 3.
// answer[i] == "Buzz" if i is divisible by 5.
// answer[i] == i (as a string) if none of the above conditions are true.

pub fn fizzbuzz(number: usize) -> String {
	if number == 0 {
		format!("{}", number)
	} else if number % 15 == 0 {
		"FizzBuzz".to_string()
	} else if number % 3 == 0 {
		"Fizz".to_string()
	} else if number % 5 == 0 {
		"Buzz".to_string()
	} else {
		format!("{}", number)
	}

}

#[cfg(test)]
mod tests {
    //use crate::lib;

use crate::fizzbuzz;

#[test]
    fn test_fizzbuzz() {
        assert_eq!(fizzbuzz(0), ("0"));
        assert_eq!(fizzbuzz(1), ("1"));
        assert_eq!(fizzbuzz(3), ("Fizz"));
        assert_eq!(fizzbuzz(5), ("Buzz"));
        assert_eq!(fizzbuzz(6), ("Fizz"));
        assert_eq!(fizzbuzz(10), ("Buzz"));
        assert_eq!(fizzbuzz(15), ("FizzBuzz"));
    }
}