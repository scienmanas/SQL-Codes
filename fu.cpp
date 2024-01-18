#include <PxPhysicsAPI.h>

struct Point3
{
    // Fill in details please
};

/**
 * Get the rotation quaternion that can be used to rotate the orientation of
 * fromPos to points its X axis to "look at" toPos
 *
 * Assumption 1: fromPos is in upright orientation to begin with. For upright
 *               orientation see the book by Dunn and Parberry
 * Assumption 2: Right handed coordinate system (PhysX is)
 * 
 */
physx::PxQuat getLookAtQuat(const Point3& fromPos, const Point3& toPos)
{
    // Position of toPos relative to fromPos
    const Point3 relToPos = Point3::sub(toPos, fromPos);

    /**
     * First we rotate fromPos around Y axis to look at toPos
     * This gives us Euler angle around Y axis
     */

    // Compute the angle
    // theta = atan(z/x)
    const float yAng0 = atan(fabs(relToPos.z()) / fabs(relToPos.x()));

    // Fix the angle based on XZ quadrant point lies in
    float yAng;
    if (relToPos.x() >= 0)
    {
        if (relToPos.z() >= 0)
            yAng = 2 * Pi - yAng0; // 360 - theta
        else
            yAng = yAng0;
    }
    else
    {
        if (relToPos.z() >= 0)
            yAng = Pi + yAng0; // 180 + theta
        else
            yAng = Pi - yAng0; // 180 - theta
    }

    /**
     * Next fromPos will look "up" to see toPos
     * This gives us Euler angle around Z axis
     */

    // Compute the angle
    // theta = atan( y / sqrt(x^2 + z^2))
    const float zAng0 = atan(fabs(relToPos.y()) /
        sqrt(relToPos.x() * relToPos.x() + relToPos.z() * relToPos.z()));

    // Fix angle based on whether toPos is above or below XZ plane
    const float zAng = (relToPos.y() >= 0) ? zAng0 : -zAng0;

    /**
     * Convert Euler angles to quaternion that rotates
     * X axis of upright orientation to point at toPos
     * Reference: PhysX Math Primer
     */

    // Convert to quaternions
    physx::PxQuat qy(yAng, physx::PxVec3(0, 1, 0));
    physx::PxQuat qz(zAng, physx::PxVec3(0, 0, 1));

    // Rotate local axes
    physx::PxQuat q = qy * qz;

    return q;
}

/**
 * Create shoulder joint using the spherical joint of PhysX
 * 
 * Idea is that the ball-socket will lie at the shoulder itself
 * So, the first body and the location of ball-socket both
 * lie at shoulder position.
 * This also means that the cone of rotation lies at shoulder too.
 * Elbow is second body and this allows upper arm to rotate.
 * 
 * We call should position as fromPos and elbow position as toPos
 */
void createShoulderJoint()
{
    // Orientation for ball-and-socket at shoulder
    const physx::PxQuat fromToQuat = getLookAtQuat(fromPos, toPos);
    
    // Transform for shoulder
    const physx::PxTransform fromTrans(physx::PxVec3(0, 0, 0), fromToQuat);
    
    // Transform for elbow
    const physx::PxTransform toTrans(Point3ToPx(fromToPos), fromToQuat);

    Joint* sjoint = physx::PxSphericalJointCreate(
        phyWorld, // PhysX world you would've created
        fromBody,
        fromTrans,
        toBody,
        toTrans);

    // Cone of rotation
    sjoint->setLimitCone(
        physx::PxJointLimitCone(.2f, .2f, .1f));

    // Limit rotation to this cone
    sjoint->setSphericalJointFlag(
        physx::PxSphericalJointFlag::eLIMIT_ENABLED,
        true);
}