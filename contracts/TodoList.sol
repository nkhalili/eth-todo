pragma solidity ^0.5.0;

contract TodoList {

  constructor() public {
    createTask("Sample task");
  }

  // number of tasks
  uint public taskCount = 0;

  // custom type Task
  struct Task {
    uint id;
    string content;
    bool completed;
  }

  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );

  // key-value pairs in solidity
  mapping(uint => Task) public tasks;

  // _content will be persisted in memory
  function createTask(string memory _content) public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
  }

  // to toggle task's checkbox and fire the event
  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }
}
