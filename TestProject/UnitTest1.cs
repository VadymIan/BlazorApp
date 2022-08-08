using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            Assert.AreEqual(4 + 1, 2 + 3);
        }

        [TestMethod]
        public void TestMethod2()
        {
            Assert.AreEqual(4 + 1, 2 + 3);
        }
        
        [TestMethod]
        public void TestMethod3()
        {
            Assert.AreEqual(4 + 2, 2 + 4);
        }
    }
}
