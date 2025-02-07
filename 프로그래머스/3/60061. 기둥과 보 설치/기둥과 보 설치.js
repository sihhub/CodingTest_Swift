//구현 문제

function solution(n, build_frame) {
  const pillarSet = new Set();
  const beamSet = new Set();

  for (let [x, y, a, b] of build_frame) {
    // a=0: 기둥, a=1: 보
    // b=0: 삭제, b=1: 설치

    switch (b) {
      case 1: {
        //설치

        console.log(`${x},${y - 1}`, pillarSet.has(`${x},${y - 1}}`));
        if (a === 0 && canPlacePillar(pillarSet, beamSet, x, y)) {
          pillarSet.add(`${x},${y}`);
        } else if (a === 1 && canPlaceBeam(pillarSet, beamSet, x, y)) {
          beamSet.add(`${x},${y}`);
        }
        break;
      }
      case 0: {
        //삭제
        if (a === 0) {
          pillarSet.delete(`${x},${y}`);
          if (!isStructureValid(pillarSet, beamSet)) {
            pillarSet.add(`${x},${y}`);
          }
        } else if (a === 1) {
          beamSet.delete(`${x},${y}`);
          if (!isStructureValid(pillarSet, beamSet)) {
            beamSet.add(`${x},${y}`);
          }
        }
        break;
      }
      default:
        break;
    }
  }

  const answer = [];
  for (let item of pillarSet) {
    let [x, y] = item.split(",");
    x = parseInt(x, 10);
    y = parseInt(y, 10);
    answer.push([x, y, 0]);
  }

  for (let item of beamSet) {
    let [x, y] = item.split(",");
    x = parseInt(x, 10);
    y = parseInt(y, 10);
    answer.push([x, y, 1]);
  }

  answer.sort((a, b) => {
    if (a[0] !== b[0]) return a[0] - b[0];
    if (a[1] !== b[1]) return a[1] - b[1];
    return a[2] - b[2];
  });

  return answer;
}

function canPlacePillar(pillarSet, beamSet, x, y) {
  if (y === 0) return true;
  if (pillarSet.has(`${x},${y - 1}`)) return true;
  if (beamSet.has(`${x - 1},${y}`) || beamSet.has(`${x},${y}`)) return true;
  return false;
}

function canPlaceBeam(pillarSet, beamSet, x, y) {
  if (pillarSet.has(`${x},${y - 1}`) || pillarSet.has(`${x + 1},${y - 1}`))
    return true;
  if (beamSet.has(`${x - 1},${y}`) && beamSet.has(`${x + 1},${y}`)) return true;
  return false;
}

function isStructureValid(pillarSet, beamSet) {
  for (let item of pillarSet) {
    let [x, y] = item.split(",");
    x = parseInt(x, 10);
    y = parseInt(y, 10);
    if (!canPlacePillar(pillarSet, beamSet, x, y)) {
      return false;
    }
  }
  for (let item of beamSet) {
    let [x, y] = item.split(",");
    x = parseInt(x, 10);
    y = parseInt(y, 10);
    if (!canPlaceBeam(pillarSet, beamSet, x, y)) {
      return false;
    }
  }
  return true;
}