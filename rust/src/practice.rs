use std::mem;

struct List {
    head: Link,
}

type Link = Option<Box<Node>>;

#[allow(dead_code)]
#[derive(Debug)]
struct Node {
    cars: usize,
    cdr: Link,
}

impl List {
    pub fn new() -> Self {
        List { head: None }
    }

    pub fn peek(&self) -> Option<usize> {
        self.head.as_ref().map(|node| node.cars)
    }

    pub fn peek_mut(&mut self) -> Option<&mut usize> {
        self.head.as_mut().map(|node| &mut node.cars)
    }

    pub fn push(&mut self, content: usize) {
        let new_node = Node {
            cars: content,
            cdr: mem::replace(&mut self.head, None),
        };
        self.head = Some(Box::new(new_node))
    }

    pub fn pop(&mut self) -> Option<usize> {
        self.head.take().map(|node| {
            self.head = node.cdr;
            node.cars
        })
    }
}

impl Drop for List {
    fn drop(&mut self) {
        let mut curr_link = self.head.take();
        while let Some(mut boxed_node) = curr_link {
            curr_link = boxed_node.cdr.take();
        }
    }
}

#[test]
fn test_list() {
    //let list = List{ head: Some(Box::new(Node{cars: 8, cdr: None}))};
    let mut list = List::new();
    list.push(5);
    list.push(8);

    assert_eq!(list.peek().unwrap(), 8);
    assert_eq!(list.pop().unwrap(), 8);
    assert_eq!(list.peek().unwrap(), 5);
    if let Some(value) = list.peek_mut() {
        *value = 42;
    }
    assert_eq!(list.peek().unwrap(), 42);

    list.peek_mut().map(|value| *value = 36);

    assert_eq!(list.peek().unwrap(), 36);
    //let list = List(Some(Box::new(Node(5, Some(Box::new(Node(6, None)))))));

    // assert_eq!(list.0, 5);
    // if let Some(next) = list.1 {
    // 	assert_eq!(next.0, 6);
    // }

    //assert_eq!(list.0.unwrap().0, 5);
    //assert_eq!(list.0.1.unwrap().0, 6);
}
