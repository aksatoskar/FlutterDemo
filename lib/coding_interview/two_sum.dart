import 'dart:math';

void main() {
  print(isValidSubsequence([5, 1, 22, 25, 6, 1, 8, 10], [1, 6, 1, 10]));
  print(sortedSquaredArray([1, 2, 3, 5, 6, 8, 9]));
  print(transposeMatrix([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]));
  print(isPalindrome('kaak'));
  print(threeNumSum([3, 7, 1, 2, 8, 4, 5], 10));
  print(threeNumSum([-1, 2, 1, -4, 5, -3], 7));
}

bool isValidSubsequence(List<int> array, List<int> sequence) {
  // Initialize the sequence index
  int seqId = 0;

  for (int num in array) {
    if (seqId == sequence.length) break;
    if (sequence[seqId] == num) {
      seqId++;
    }
  }

  return seqId == sequence.length;
}

List<int> sortedSquaredArray(List<int> array) {
  List<int> result = List.filled(array.length, 0);
  int smallerValueIdx = 0;
  int largerValueIdx = array.length - 1;

  for (int idx = array.length - 1; idx >= 0; idx--) {
    int smallerValue = array[smallerValueIdx];
    int largerValue = array[largerValueIdx];

    if (smallerValue.abs() > largerValue.abs()) {
      result[idx] = smallerValue * smallerValue;
      smallerValueIdx++;
    } else {
      result[idx] = largerValue * largerValue;
      largerValueIdx--;
    }
  }
  return result;
}

int nonConstructibleChange(List<int> coins) {
  coins.sort();
  int currentChangeCreated = 0;

  for (int coin in coins) {
    if (coin > currentChangeCreated + 1) {
      return currentChangeCreated + 1;
    }
    currentChangeCreated += coin;
  }

  return currentChangeCreated + 1;
}

List<List<int>> transposeMatrix(List<List<int>> matrix) {
  List<List<int>> result = [[]];

  for (int col = 0; col < matrix[0].length; col++) {
    List<int> newRow = [];
    for (int row = 0; row < matrix.length; row++) {
      newRow.add(matrix[row][col]);
    }
    result.add(newRow);
  }
  return result;
}
class BST {
  int value;
  BST? left;
  BST? right;

  BST(this.value);
}

int findClosestValueInBst(BST tree, int target) {
  // Start the helper function with the root node's value as the initial closest value
  return findClosestValueInBstHelper(tree, target, tree.value);
}

int findClosestValueInBstHelper(BST tree, int target, int closest) {
  int newClosest = closest;

  if ((target - closest).abs() > (target - tree.value).abs()) {
    newClosest = tree.value;
  }

  if (target < tree.value && tree.left != null) {
    return findClosestValueInBstHelper(tree.left!, target, newClosest);
  } else if (target > tree.value && tree.right != null) {
    return findClosestValueInBstHelper(tree.right!, target, newClosest);
  } else {
    return newClosest;
  }
}

bool isPalindrome(String input) {
  var start = 0;
  var end = input.length - 1;

  while (start < end) {
    if (input[start] == input[end]) {
      start++;
      end--;
    } else {
      return false;
    }
  }
  return true;
}

bool threeNumSum(List<int> nums, int target) {
  nums.sort();
  for (int i = 0; i < nums.length - 2; i++) {
    int low = i + 1;
    int high = nums.length - 1;
    while (low < high) {
      int tripple = nums[i] + nums[low] + nums[high];
      if (tripple == target) {
        return true;
      } else if (tripple < target) {
        low++;
      } else {
        high--;
      }
    }
  }
  return false;
}