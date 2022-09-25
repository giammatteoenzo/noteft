pragma solidity ^0.8.17;


contract Note {
  uint taskCount = 0;
    constructor() public {
        createTask("Ma premiere note");
      }
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

    function toggleCompleted(uint _id) public {
      Task memory _task = tasks[_id];
      _task.completed = !_task.completed;
      tasks[_id] = _task;
      emit TaskCompleted(_id, _task.completed);
    }


    mapping(uint => Task) public tasks;

      function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
          emit TaskCreated(taskCount, _content, false);
    }
}